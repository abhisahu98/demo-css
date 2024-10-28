pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "my-website"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE}:${env.BUILD_NUMBER} ."
                }
            }
        }

        stage('Deploy Locally') {
            steps {
                script {
                    sh """
                    docker stop my-website || exit 0
                    docker rm my-website || exit 0
                    docker run -d -p 81:81 --name my-website ${DOCKER_IMAGE}:${env.BUILD_NUMBER}
                    """
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
        success {
            echo 'Docker image built and deployed successfully!'
        }
        failure {
            echo 'Failed to build or deploy the Docker image.'
        }
    }
}