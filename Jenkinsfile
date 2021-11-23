pipeline{
        agent {label 'master'}
        parameters { 
        string(defaultValue: "https://github.com/Devopssampleproject/videocalling.git", description: 'Whats the github URL?', name: 'URL')
        string(defaultValue: "lakshmankumar2611", description: 'Whats the github URL?', name: 'USERNAME')
        credentials(defaultValue: 'github-access-token', name: 'TOKEN')        
        }
        stages{ 
                stage('create branch'){
                steps('checkout'){
                        sh 'git config --global credential.helper cache'
                        sh 'git config --global credential.helper cache'
                        sh 'git config --global push.default simple'

                        checkout([
                            $class: 'GitSCM',
                        //    branches: [[name: master]],
                            extensions: [
                                [$class: 'CloneOption', noTags: true, reference: '', shallow: true]
                            ],
                            submoduleCfg: [],
                            userRemoteConfigs: [
                                [ credentialsId: 'jenkins-sshkey', url: "${params.URL}"]
                            ]
                        ])
                        withCredentials([string(credentialsId: "${params.TOKEN}", variable: 'FILE')]) {
                        sh 'git checkout test46-release/2021.11.01' //To get a local branch tracking remote
                      //  sh 'git config --global user.name "lakshmankumar2661"'
                      //  sh 'git config --global user.email "mlk.lucky836@gmail.com"'
                 
                                sh 'git push https://oauth2:"${credentialsId}"@github.com/Devopssampleproject/videocalling.git  test46-release/2021.11.01'
                        }        
                        }
               }
        }
}
