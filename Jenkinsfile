// task

// build docker imageand send to dockerhub

def gv
pipeline{
    agent any 

    parameters{
        booleanParam(name: 'execute_init', defaultValue: true, description: 'Is debug build')
    }
    stages{
        stage("init"){
            steps{
                when{
                    expression{
                        params.execute_init == true
                    }
                }

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
                    // withDockerRegistry(credentialsId:'docker_cred',url:''){
                    // image.push('latest')
                    // }
                    gv = load 'script.groovy'
                    gv.buildImage()
                }
            }
        }

        


    }
        
    
}