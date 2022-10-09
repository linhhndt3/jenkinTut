pipeline {
    agent { dockerfile true }
    stages {
        stage('Stage 1') {
            steps {
                sh 'docker build -t linhhut/jenkin-tut .'
                sh 'docker push linhhut/jenkin-tut'
            }
        }
    }
}
