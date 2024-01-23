pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'some-content-nginx'
        CONTAINER_NAME = 'some-nginx10'
        PORT_MAPPING = '8081:80'
    }

    stages {
        stage('Checkout') {
            steps {
                // Menghapus direktori sebelum checkout
                deleteDir()
                // Checkout kode dari repositori GitHub
                git url: 'https://github.com/ilham275/template_ethereal.git', branch: 'main'
                    // Menjalankan Docker build
                sh "docker build -t ${BUILD_NUMBER} -f Dockerfile ."
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Mendapatkan path Docker
                   def dockerPath = sh(script: 'where docker', returnStdout: true).trim()
                    echo "Docker Path: ${dockerPath}"
                    bat "export PATH=\$PATH:${dockerPath}"

                    // Menjalankan Docker build
                    bat "docker build -t ${DOCKER_IMAGE} -f Dockerfile ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Menjalankan Docker container
                    bat "docker run -d -p ${PORT_MAPPING} --name ${CONTAINER_NAME} ${DOCKER_IMAGE}"
                }
            }
        }
    }

    post {
        always {
            script {
                // Memberhentikan dan menghapus Docker container setelah selesai
                sh "docker stop ${CONTAINER_NAME}"
                sh "docker rm ${CONTAINER_NAME}"
            }
        }
    }
}
