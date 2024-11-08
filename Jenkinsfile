pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git credential: 'ef909081-f111-445a-b5e3-0eebea4e8d82' git branch: 'main', url: 'https://github.com/rajisri2609/python-app.git'
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
