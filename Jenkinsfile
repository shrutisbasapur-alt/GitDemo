pipeline {
agent any

stages {

    stage('Checkout Code') {
        steps {
            checkout scm
        }
    }

    stage('Build') {
        steps {
            echo 'Building application...'
            sh 'ls -la'
        }
    }

    stage('Test') {
        steps {
            echo 'Running tests...'
            sh 'chmod +x test.sh'
            sh './test.sh'
        }
    }

    stage('Docker Build') {
        steps {
            echo 'Building Docker image...'
            sh 'docker build -t jenkins-cicd-pipeline:latest .'
        }
    }

    stage('Docker Run/Deploy') {
        steps {
            echo 'Deploying application...'
            sh '''
                docker stop jenkins-cicd-pipeline || true
                docker rm jenkins-cicd-pipeline || true
                docker run -d --name jenkins-cicd-pipeline -p 8080:80 jenkins-cicd-pipeline:latest
            '''
        }
    }
}

post {
    success {
        echo 'CI/CD Pipeline completed successfully!'
    }
    failure {
        echo 'CI/CD Pipeline failed!'
    }
}
}
