pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Building the Docker image
                    sh 'docker build -t myapp .'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Running the tests inside the container using 'docker run'
                    // Adjusting the command to use Python unit tests instead of Maven.
                    // Since you mentioned Python, this would run unit tests inside the Python container.
                    docker.image('my-python-app:latest').inside {
                        sh 'python -m unittest discover -s tests'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Running the Docker container in detached mode, publishing port 8080
                    sh 'docker run -d -p 8080:8080 myapp'
                }
            }
        }
    }
}