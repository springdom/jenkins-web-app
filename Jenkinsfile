pipeline {
    agent any
    tools {
        python 'Python3' // Make sure to configure Python in Jenkins global tool configuration
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<YOUR_GITHUB_USERNAME>/flask-jenkins-app.git'
            }
        }
        stage('Setup') {
            steps {
                sh 'python -m venv venv'
                sh 'source venv/bin/activate && pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                // Add your test commands here, e.g., pytest
                sh 'echo "No tests specified"'
            }
        }
        stage('Deploy') {
            steps {
                sh '''
                docker build -t flask-jenkins-app .
                docker run -d -p 5000:5000 flask-jenkins-app
                '''
            }
        }
    }
}
