pipeline{
        agent {label 'master'}
        stages{ 
                stage('create branch'){
                steps('checkout'){
                        sh 'git config --global credential.helper cache'
                        sh 'git config --global credential.helper cache'
                        sh 'git config --global push.default simple'

                        checkout([
                            $class: 'GitSCM',
                            branches: [[name: release/2021.11.01]],
                            extensions: [
                                [$class: 'CloneOption', noTags: true, reference: '', shallow: true]
                            ],
                            submoduleCfg: [],
                            userRemoteConfigs: [
                                [ credentialsId: 'gitlogin', url: cloneUrl]
                            ]
                        ])
                        sh "git checkout test46-release/2021.11.01}" //To get a local branch tracking remote
                        sh "git push"
                        }
               }
        }
}
