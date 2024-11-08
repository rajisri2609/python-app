pipeline {
    agent any

    environment {
        // Define environment variables for your application
        IMAGE_NAME = 'myapp'
        CONTAINER_NAME = 'myapp-container'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build the Docker image
                    echo "Building Docker image: ${IMAGE_NAME}"
                    sh 'docker build -t ${IMAGE_NAME} .'
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Run tests using Maven inside a Docker container
                    echo "Running tests inside the Docker container"
                    sh 'docker run --rm ${IMAGE_NAME} mvn test'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Stop and remove any existing containers with the same name
                    echo "Stopping and removing existing container if any"
                    sh '''
                        docker stop ${CONTAINER_NAME} || true
                        docker rm ${CONTAINER_NAME} || true
                    '''

                    // Run the application in a new container
                    echo "Deploying the app to Docker container"
                    sh 'docker run -d -p 8080:8080 --name ${CONTAINER_NAME} ${IMAGE_NAME}'
                }
            }
        }

        stage('Clean Up') {
            steps {
                script {
                    // Optionally clean up unused Docker images and containers
                    echo "Cleaning up unused Docker images and containers"
                    sh 'docker system prune -f'
                }
            }
        }
    }

    post {
        always {
            // Cleanup the environment if necessary
            echo "Pipeline complete. Cleaning up."
            cleanWs() // Clean workspace
        }
    }
}