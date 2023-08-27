// task

// build docker imageand send to dockerhub

def gv
pipeline{
    agent any 

    parameters{
        booleanParam(name: 'Build_Jar_file', defaultValue: false, description: 'Is debug build')
    }
    stages{
        stage("Build Jar file"){
            when{
                    expression{
                        params.Build_Jar_file
                    }
                }
            steps{
                
                echo "its Working"
                sh 'ls'
                sh 'pwd'
                mvn clean package
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