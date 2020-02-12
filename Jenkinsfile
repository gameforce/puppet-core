pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes'
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: kube
    image: lachlanevenson/k8s-kubectl:v1.8.0
    command: ['cat']
    tty: true
"""
    }
  }
  stages {
    stage('Run kubectl') {
      steps {
        container('kube') {
          sh 'kubectl -n puppetserver exec -it puppetserver-puppetserver-helm-cha-puppetserver-56c4c9975-fkm2f -- r10k /etc/puppetlabs/code/environments/$BRANCH_NAME/ puppetfile check'
        }
      }
    }
  }
}