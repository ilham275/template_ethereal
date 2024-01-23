pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'web'
        CONTAINER_NAME = 'some-nginx10'
        PORT_MAPPING = '8081:80'  // Adjust the port mapping as needed
    }

    stages {
        // stage('Checkout') {
        //     steps {
        //         // Clean workspace before checkout
        //         deleteDir()
        //         // Checkout the HTML source code from GitHub
        //         git url: 'https://github.com/atoschova'
        //     }
        // }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container based on the built image
                   sh 'docker run --name agus -d -p 8090:80 web'
                }
            }
        }
    }

    post {
        always {
            script {
                // Stop and remove the Docker container after execution
                docker.image("${DOCKER_IMAGE}").stop()
                docker.image("${DOCKER_IMAGE}").remove()
            }
        }
    }
}