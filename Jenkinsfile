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
            // input{
            //     message "Select the Environment to deploy"
            //     ok "Env Selected"
            //     parameters{
            //         choice(name:"ChooseEnv", choices:['dockerhub','ecr'], description:'')
            //     }
            // }

            steps{

                script{

                    def userInput = input( message:"Select the Environment to deploy",
                    id: 'userInput',
                     ok : "Done",
                     parameters:[
                        choice(name:"ChooseEnv", choices:['dockerhub','ecr'],
                      description:'')
                      ])

                    // withDockerRegistry(credentialsId:'docker_cred',url:''){
                    // image.push('latest')
                    // }
                    echo "User selected: ${userInput}"
                    gv = load 'script.groovy'

                    if (userInput == 'dockerhub'){
                        
                    gv.pushToDockerHub()
                    
                    }

               }
     }              
           } 

        stage("updating menifest repo with new docker image"){
             environment {
            GIT_REPO_NAME = "Jenkins-pipeline-end-to-end"
            GIT_USER_NAME = "nileshyav"
        }
            
            
             steps{
                script{
                    withCredentials([string(credentialsId: 'github_secret', variable: 'GITHUB_TOKEN')]){
                sh '''   
                git config user.email "nileshyaduvanshi@outlook.com"
                git config user.name "nileshyav"
                
                ls
                cd deployment
                ls
                sed -i  "s/34/${BUILD_NUMBER}/g" deploy.yaml
                cat deploy.yaml
                git add deploy.yaml
                
                git commit -m 'upated the deploy.yaml file'
                git remote -v
               git push https://${GITHUB_TOKEN}@github.com/${GIT_USER_NAME}/${GIT_REPO_NAME} HEAD:master
                '''

             }
                }
             }

        }                            
                
                    
    }}
