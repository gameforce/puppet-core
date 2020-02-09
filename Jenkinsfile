pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Validate the syntax of the puppetfile"'
                sh "sh r10k /etc/puppetlabs/code/environments/$BRANCH_NAME/ puppetfile check -v"
            }
        }
    }
}