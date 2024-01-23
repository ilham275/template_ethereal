pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'some-content-nginx'
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

            // stage('Checkout') {
            // steps {
            //     deleteDir()
            //     checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/ilham275/template_ethereal.git']]])
            //             // Tambahkan pernyataan log untuk menampilkan direktori saat ini
            // }
        // }
        stage('Run Docker Container') {
            steps {
                script {
                    // Run Docker container based on the built image
                    // docker.image("${DOCKER_IMAGE}").run("-p ${PORT_MAPPING} --name ${CONTAINER_NAME}")
                    sh 'docker run --name web_server -d -p 8089:80 some-content-nginx'
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