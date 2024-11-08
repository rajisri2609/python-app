pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'ef909081-f111-445a-b5e3-0eebea4e8d82', branch: 'main', url: 'https://github.com/rajisri2609/python-app.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build('my-python-app:latest')
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // This assumes you are using a Unix-based agent or Docker
                    docker.image('my-python-app:latest').inside {
                        sh 'python -m unittest discover -s tests'
                    }
                    // If you're using a Windows-based agent, use bat instead of sh:
                    // docker.image('my-python-app:latest').inside {
                    //     bat 'python -m unittest discover -s tests'
                    // }
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Cleans workspace after each build
        }
    }
}
