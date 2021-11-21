pipeline{
        agent {label 'master'}
        stages{ 
                stage('create branch'){
        steps{
                sh 'git checkout -b test03-release/2021.11.01'
            //stdout = sh(script:'git checkout -b test-release/2021.11.01',  returnStdout: true)
            // println("GIT add stdout ################ " + stdout + " ####################")
            
            //withCredentials([usernamePassword(credentialsId: 'gitlogin_newbranch', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) 
                
                sh 'git push origin test03-release/2021.11.01'
                
                } //steps close
        
                } //stage close
        } //stages close
} //pipeline
