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

pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t xvaikum/notejam-pipeline .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push xvaikum/notejam-pipeline'
      }
    }
    stage('Run') {
      steps {
        sh 'docker run -dp 3000:3000 xvaikum/notejam-pipeline'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}

