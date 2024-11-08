pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    // Use 'start' for Windows to run the process in the background
                    bat 'start docker build -t myapp .'
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Running tests without 'nohup' for Windows
                    bat 'docker run myapp mvn test'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Running the deploy process without 'nohup' for Windows
                    bat 'start docker run -d -p 8080:8080 myapp'
                }
            }
        }
    }
}
