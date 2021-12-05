#!/bin/bash


#PARTITION_COUNT={{ partitions_per_device }}
PARTITION_COUNT=4

#set -e
set -x

# Ensure no mounted all flash partitions
for mount in $(cat /proc/mounts | grep all_flash | awk '{print $2}')
do 

       sudo umount $mount
       echo "Unmounting $mount"
done

for SSD_DRIVE in /dev/xvd*
do
        if [  $SSD_DRIVE != /dev/xvda ]
	then
		PARTED_SCRIPT="${SSD_DRIVE} mklabel gpt"
		for count in $(seq 1 $PARTITION_COUNT)
		do
			START=$(( ( $count -1 ) * 100 / $PARTITION_COUNT ))
			END=$(( $count * 100 / $PARTITION_COUNT ))
			PARTED_SCRIPT="$PARTED_SCRIPT mkpart primary ${START}% ${END}%"
		done
		echo "Partitioning $SSD_DRIVE into $PARTITION_COUNT partitions"
		sudo parted -a opt --script $PARTED_SCRIPT
	fi
done

available_drives=`ls /dev/xvd* | grep -v /dev/xvda | grep 1`
echo "$available_drives"

all_flash_array=($available_drives)
      for i in ${!all_flash_array[@]}
      do
        mkfs.xfs -f ${all_flash_array[$i]}
        if [ ! -d /xvd_all_flash_${i} ]
        then
          mkdir /xvd_all_flash_${i}
        fi
        if [ ! "$(df -kh | grep ${all_flash_array[$i]} | grep xvd_all_flash_${i})" ]
        then
          mount ${all_flash_array[$i]} /xvd_all_flash_${i}
        fi
        if [  "$(df -kh | grep ${all_flash_array[$i]} | grep xvd_all_flash_${i})" ]
        then
          blkid_list=`blkid | grep -w UUID | grep -v /dev/xvda1 | cut -d ' ' -f 2 | cut -d '"' -f 2`
          blkid_array=($blkid_list)
          for i in ${!blkid_array[@]}
          do
           echo "UUID=${blkid_array[$i]} /xvd_all_flash_${i}            xfs     defaults,nofail 0 2" >> /etc/fstab
          done
        fi
        for i in ${!/xvd_all_flash_[@]}
        do
          mkdir /xvd_all_flash_${i}/APP_LOGS
          mkdir /xvd_all_flash_${i}/APP_LOGS/aerospike
        done
        mkdir -p  /var/run/aerospike
        chown root:root /var/run/aerospike/
      done
