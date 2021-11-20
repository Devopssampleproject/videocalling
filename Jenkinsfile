stage('create branch')
        { 
            stdout = sh(script:'git checkout -b release/2021.11.01',  returnStdout: true)
            println("GIT add stdout ################ " + stdout + " ####################")
            
            withCredentials([usernamePassword(credentialsId: 'gitlogin', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) 
            {
                sh('git push origin release/test3')         
            }
        }
