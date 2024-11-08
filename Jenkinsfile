pipeline {
    agent any

    environment {
        // Optionally add environment variables, like Docker registry credentials
        DOCKER_IMAGE = 'my-python-app:latest'
        DOCKER_REGISTRY = 'dockerhub'  // Replace with your registry if needed
    }

    stages {
        // Stage for cloning the GitHub repository
        stage('Clone Repository') {
            steps {
                script {
                    // Use correct repository URL
                    git branch: 'main', url: 'https://github.com/rajisri2609/python-app.git'
                }
            }
        }

        // Stage to build the Docker image
        stage('Build Docker Image') {
            steps {
                script {
                    // Builds Docker image using the Dockerfile in the repository
                    docker.build(DOCKER_IMAGE)
                }
            }
        }

        // Stage for running tests inside the Docker container
        stage('Run Tests') {
            steps {
                script {
                    // Runs tests using the unittest framework inside the Docker container
                    docker.image(DOCKER_IMAGE).inside {
                        sh 'python -m unittest discover -s tests'
                    }
                }
            }
        }
    }

    post {
        // Always clean the workspace after the pipeline completes
        always {
            cleanWs()
        }
    }
}
