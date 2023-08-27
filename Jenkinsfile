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
                sh 'mvn clean install'

                sh 'mvn clean package'
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
            input{
                message "Select the Environment to deploy"
                ok "Env Selected"
                parameters{
                    choice(name:"ChooseEnv", choices:['dockerhub'], description:'')
                }
            }
            steps{
                script{
                    // withDockerRegistry(credentialsId:'docker_cred',url:''){
                    // image.push('latest')
                    // }
                    
                    gv = load 'script.groovy'
                    dockerhub = gv.pushToDockerHub()
                    echo "Deploying to ${ChooseEnv}"
                }
            }
        }

        


    }
        
    
}