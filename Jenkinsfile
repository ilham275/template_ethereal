pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'ls -1'
                    // Build Docker image dari Dockerfile di direktori proyek
                    sh 'docker build -t web -f Dockerfile .'
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Jalankan Docker container dari image yang telah dibangun
                    def containerName = 'nama-container'
                    def portMapping = '8080:80'  // Sesuaikan port mapping sesuai kebutuhan
                    docker.image("web").run("-p ${portMapping} --name ${containerName}")
                }
            }
        }
    }
}
