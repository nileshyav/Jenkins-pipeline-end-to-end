def pushToDockerHub(){
    echo "Hey I'm building Image"
    withDockerRegistry(credentialsId:'docker_cred',url:''){
                    image.push("latest + ${BUILD_NUMBER}" )
                    }
}

return this 