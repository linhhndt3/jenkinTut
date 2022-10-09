pipeline {
    agent { dockerfile true }
    stages {
        stage('Stage 1') {
            steps {
                'docker build -t linhhut/jenkin-tut .'
                'docker push linhhut/jenkin-tut'
            }
        }
    }
}
