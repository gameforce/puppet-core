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
          sh 'kubectl get pods'
        }
      }
    }
  }
}