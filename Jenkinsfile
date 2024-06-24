pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/<YOUR_GITHUB_USERNAME>/flask-jenkins-app.git'
            }
        }
        stage('Setup') {
            steps {
                sh '''
                python3 -m venv venv
                . venv/bin/activate
                pip install -r requirements.txt
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                . venv/bin/activate
                # Add your test commands here, e.g., pytest
                echo "No tests specified"
                '''
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
