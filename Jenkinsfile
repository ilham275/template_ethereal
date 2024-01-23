pipeline {
    agent any
    environment {
        PATH = "${PATH}:/usr/bin/jenkis.sh"
        DOCKER_IMAGE = 'some-content-nginx'
        CONTAINER_NAME = 'some-nginx10'
        PORT_MAPPING = '8081:80'  // Adjust the port mapping as needed
    }

    stages {

                stage('Check Docker Version') {
            steps {
                script {
                    // Tambahkan path Docker ke PATH jika diperlukan
                    sh 'export PATH=$PATH:/usr/bin/docker && docker --version'
                }
            }
        }

        stage('Checkout') {
            steps {
                script{
               echo "Current PATH: ${env.PATH}"
                }
            }
        }
        stage('Run Docker Container21212') {
            steps {
                script {
                    sh 'echo $PATH'
                    // Run Docker container based on the built image
                    docker.image("${DOCKER_IMAGE}").run("-p ${PORT_MAPPING} --name ${CONTAINER_NAME}")
                }
            }
        }

           stage('Check Docker Version100') {
            steps {
                script {
                    // Menggunakan alat Docker dari konfigurasi global
                    def dockerHome = tool 'docker'
                    sh "${dockerHome}/bin/docker --version"
                }
            }
        }

           stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker --version'
                    // Run Docker container based on the built image
                    docker.image("${DOCKER_IMAGE}").run("-p ${PORT_MAPPING} --name ${CONTAINER_NAME}")
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