pipeline {
    agent {
        label 'slaveNode1'
    }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {

        stage('SCM Checkout') {
            steps {
                git 'https://github.com/linhhndt3/jenkinTut.git'
            }
        }

        stage('Build docker image') {
            steps {
                sh 'sudo docker build -t linhhut/jenkin-tut:$BUILD_NUMBER .'
            }
        }

        stage('login to dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | sudo docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('push image') {
            steps {
                sh 'sudo docker push linhhut/jenkin-tut:$BUILD_NUMBER'
            }
        }

    }
    post {
        always {
            sh 'sudo docker logout'
        }
    }
}
