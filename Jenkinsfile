pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Validate the syntax of the puppetfile"'
                    r10k puppetfile check -v
            }
        }
    }
}