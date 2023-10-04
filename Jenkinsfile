pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh 'docker build -t xvaikum/notejam_pipeline .'
            }
        }
        stage('Push') {
            steps {
                echo 'Testing..'
                sh 'docker push xvaikum/notejam-pipeline'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
                sh 'docker run -dp 3002:3000 xvaikum/notejam-pipeline'
            }
        }
    }
}
