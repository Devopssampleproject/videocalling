pipeline{
        agent {label 'master'}
        parameters { 
        string(defaultValue: "https://github.com/Devopssampleproject/videocalling.git", description: 'Whats the github URL?', name: 'URL')
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
                                [ credentialsId: 'gitlogin', url: "${params.URL}"]
                            ]
                        ])
                        sh "git checkout test46-release/2021.11.01" //To get a local branch tracking remote
                        sh "git push"
                        }
               }
        }
}
