pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Validate the syntax of the puppetfile"'
                    kubectl -n puppetserver exec -it puppetserver-puppetserver-helm-cha-puppetserver-56c4c9975-hrlhp sh r10k /etc/puppetlabs/code/environments/$BRANCH_NAME/ puppetfile check -v
            }
        }
    }
}