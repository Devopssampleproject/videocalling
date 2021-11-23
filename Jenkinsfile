pipeline{
        agent {label 'master'}
        parameters { 
        string(defaultValue: "https://github.com/Devopssampleproject/videocalling.git", description: 'Whats the github URL?', name: 'URL')
        string(defaultValue: "lakshmankumar2611", description: 'Whats the github URL?', name: 'USERNAME')
        string(defaultValue: "release", description: 'Whats the branch name you want to create a branch from??', name: 'BRANCH_NAME')
        string(defaultValue: "test", description: 'Whats the branch prefix you want to add example "test", it would look like "test-release"?', name: 'BRANCH_PREFIX')
        string(defaultValue: "2021.11.01", description: 'Whats the date format for the branch you want to create a branch from for example if you want to create a branch from "release/2021.11.01" it should be given in the format of YYYY.MM.DD?', name: 'DATE_FORMAT')
        credentials(defaultValue: 'github-access-token', name: 'TOKEN')        
        }
        stages{ 
                stage('create branch'){
                steps('checkout'){
                //        sh 'git config --global credential.helper cache'
                //        sh 'git config --global credential.helper cache'
                //        sh 'git config --global push.default simple'

                        checkout([
                            $class: 'GitSCM',
                            branches: [[name: '*/master']],
                            extensions: [
                                [$class: 'CloneOption', noTags: true, reference: '', shallow: true]
                            ],
                            submoduleCfg: [],
                            userRemoteConfigs: [
                                [ credentialsId: 'jenkins-sshkey', url: "${params.URL}"]
                            ]
                        ])
                        withCredentials([string(credentialsId: "${params.TOKEN}", variable: 'TEXT')]) {
                        sh 'echo PUSH_URL=echo "${URL}"' // | awk  "//" -F: "{print $2}"'
                        sh '$PUSH_URL | awk  "//" -F: "{print $2}"'
                        sh 'git checkout "${BRANCH_NAME}"/"${DATE_FORMAT}"' //To get a local branch tracking remote
                        sh 'git checkout -b "${BRANCH_PREFIX}"-"${BRANCH_NAME}"/"${DATE_FORMAT}"'
                        sh 'git push https://"$TEXT"@github.com/Devopssampleproject/videocalling.git  "${BRANCH_PREFIX}"-"${BRANCH_NAME}"/"${DATE_FORMAT}"'
                        }        
                        }
               }
        }
}
