pipeline{
        agent {label 'master'}
        stages{ 
                stage('create branch'){
                      //  environment{
                        // SECRET_FILE_ID = credentials('gitlogin_newbranch')}
        steps{
               // sh 'git checkout release/2021.11.01'
                //sh 'git checkout -b test15-release/2021.11.01'
            //stdout = sh(script:'git checkout -b test-release/2021.11.01',  returnStdout: true)
            // println("GIT add stdout ################ " + stdout + " ####################")
            
            withCredentials([usernamePassword(credentialsId: 'gitlogin_newbranch', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) 
                {
                        sh 'git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/Devopssampleproject/videocalling.git'
                        sh 'git checkout -b test26-release/2021.11.01'
                        sh 'git push --set-upstream origin test24-release/2021.11.01'
                        
                }
               
//                withCredentials([usernamePassword(credentialsId: 'gitlogin', passwordVariable: 'PASSWORD', usernameVariable: 'USERNAME')])
//                 { sh 'echo $PASSWORD'
//                   sh 'echo $USERNAME'
//                   sh 'git config --global credential.helper cache'
//                   sh 'git config --global credential.helper 'store --file ~/.my-credentials''
                  // sh 'npm install -g git-credential-env'
                  //sh 'git config credential.helper "env --sername=USERNAME --password=PASSWORD"'
                  // sh 'git config credential.helper "!f() { echo "Username=${USERNAME}; echo Password=${PASSWORD}"; }; f"'
                 // sh 'git remote add origin https://github.com/Devopssampleproject/videocalling.git'
//                   sh 'git push --set-upstream origin test24-release/2021.11.01'
//                   sh 'echo $USERNAME'
                 
                 //      sh 'git checkout -b test24-release/2021.11.01'
                //sh 'git remote -v'
                   
           //  sh 'git push --set-upstream origin test24-release/2021.11.01 '
                }
               // sh 'git push https://github.com/Devopssampleproject/videocalling.git test09-release/2021.11.01'
               // https://{TOKEN}@github.com/{USER}/{REPO}.git
                } //steps close
        
                } //stage close
        } //stages close
} //pipeline
