pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'bundling'
                sh 'bundle install'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh 'bundle rspec'
                junit '**/target/*.xml'
            }
        }
    }
}
