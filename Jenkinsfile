pipeline {
    agent any

    environment {
        WORKDIR = "C:/ProgramData/Jenkins/.jenkins/workspace/python-pipeline/"
    }

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
                    // Use docker.inside() to run tests inside the container
                    // Correct the path format for Windows systems
                    docker.image('my-python-app:latest').inside("-v ${WORKDIR}:${WORKDIR} -w ${WORKDIR}") {
                        // Run tests inside the container using unittest
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
