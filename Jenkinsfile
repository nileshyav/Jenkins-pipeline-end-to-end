// task

// build docker imageand send to dockerhub

def gv
pipeline{
    agent any 

    parameters{
        booleanParam(name: 'Build_Jar_file', defaultValue: true, description: 'Is debug build')
    }
    stages{
        stage("Build Jar file"){
            when{
                    expression{
                        params.Build_Jar_file == true
                    }
                }
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

        stage("Push image to Repository"){
            def userInput = input{
                message "Select the Environment to deploy"
                ok "Env Selected"
                parameters{
                    choice(name:"ChooseEnv", choices:['dockerhub','ecr'], description:'')
                }
            }

            

            steps{
                script{
                    // withDockerRegistry(credentialsId:'docker_cred',url:''){
                    // image.push('latest')
                    // }
                    
                    gv = load 'script.groovy'

                    if (userInput == 'dockerhub'){
                        
                    gv.pushToDockerHub()
                    echo "Deploying to ${ChooseEnv}"
                    }
                    
                        
                    
                    }                    
                }
            }
        }

        


    }
        
    
