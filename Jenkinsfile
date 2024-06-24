pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/springdom/jenkins-web-app.git'
            }
        }
        stage('Install Dependencies') {
            steps {
                script {
                    docker.image('node:14').inside('-p 3000:3000') {
                        sh 'npm install'
                    }
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    docker.image('node:14').inside('-p 3000:3000') {
                        sh 'npm run build'
                    }
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    docker.image('node:14').inside('-p 3000:3000') {
                        sh 'npm test'
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.image('node:14').inside('-p 3000:3000') {
                        sh 'docker build -t jenkins-web-app .'
                        sh 'docker run -d -p 3000:3000 jenkins-web-app'
                    }
                }
            }
        }
    }
}
