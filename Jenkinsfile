pipeline {
    agent {
        docker {
            label "jenkins-agent"
           }
    }
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    agent {
    stages {
        stage('SCM Checkout') {
            steps{
            git 'https://github.com/linhhndt3/jenkinTut.git'
            }
        }

        stage('Build docker image') {
            steps {
                sh 'docker build -t linhhut/jenkin-tut:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push linhhut/jenkin-tut:$BUILD_NUMBER'
            }
        }
    }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
