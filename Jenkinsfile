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
                    // Ensure path compatibility with Windows
                    def workDir = "C:/ProgramData/Jenkins/.jenkins/workspace/python-pipeline/"
                    def dockerContainer = docker.run("-v ${workDir}:${workDir} -w ${workDir} my-python-app:latest")

                    // Execute test command inside the container
                    dockerContainer.inside {
                        bat 'python -m unittest discover -s tests'
                    }
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
