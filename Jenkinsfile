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
                    // Build the Docker image with the tag "my-python-app:latest"
                    docker.build('my-python-app:latest')
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Define the working directory
                    def workDir = "C:/ProgramData/Jenkins/.jenkins/workspace/python-pipeline/"
                    
                    // Use docker.image().inside() to run the tests inside the container
                    docker.image('my-python-app:latest').inside("-v ${workDir}:${workDir} -w ${workDir}") {
                        // Run tests inside the container using bat (for Windows)
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
