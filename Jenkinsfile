pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/your-repo-url.git'
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
                    docker.image('my-python-app:latest').inside {
                        sh 'python -m unittest discover -s tests'
                    }
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}

