// task

// build docker imageand send to dockerhub


pipeline{
    agent any 


    stages{
        stage("init"){
            steps{
                echo "its Working"
                sh 'ls'
                sh 'pwd'
            }
        }

        stage("Build DOcker Image"){
            steps{
                script{
                     image = docker.build("nileshyav/java_ready_image")
                }
            }
        }

        stage("Push image to dockerhub"){
            steps{
                script{
                    withDockerRegistry(credentialsId:'docker_cred',url:'')
                image.push('latest')
                }
            }
        }

        


    }
        
    
}