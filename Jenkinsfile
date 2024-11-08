pipeline {
    agent any

    environment {
        // Ensure Docker is available in the pipeline environment
        DOCKER_CLI_EXPERIMENTAL = 'enabled'  // Optional: If you're using experimental features of Docker CLI
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/rajisri2609/python-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Ensure that Docker is available and build the Docker image
                    docker.build('my-python-app:latest')
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run tests inside the Docker container
                    docker.image('my-python-app:latest').inside {
                        sh 'python -m unittest discover -s tests'
                    }
                }
            }
        }
    }

    post {
        always {
            // Clean workspace after pipeline execution
            cleanWs()
        }
    }
}
