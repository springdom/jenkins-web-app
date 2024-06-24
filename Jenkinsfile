pipeline {
    agent {
        docker {
            image 'node:14'
            args '-p 3000:3000'
        }
    }
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/springdom/jenkins-web-app'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Build') {
            steps {
               sh 'npm run build'
             }
        }
        stage('Test') {
            steps {
               sh 'npm test'
            }
        }
        stage('Deploy')
            steps {
               sh 'docker build -t jenkins-web-app .'
               sh 'docker run -d -p 3000:3000 jenkins-web-app'
            }
        }
    }
}
