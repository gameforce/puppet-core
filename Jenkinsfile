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
    stage('Check Kubernetes environments') {
      steps {
        container('kube') {
          script {
            PUPPET_CONTAINER = sh (script: "kubectl -n puppetserver get pods --no-headers | grep cha-puppets | awk '{print \$1}'", returnStdout: true).trim()
          }
            print 'Lookup master pod name...'
            sh "echo ${PUPPET_CONTAINER}"
            print 'Checking namespace existence...'
            sh "kubectl get ns puppetserver"
        }
      }
    }
    
    stage('Run kubectl') {
      steps {
        container('kube') {
          sh 'kubectl -n puppetserver exec -i puppetserver-puppetserver-helm-cha-puppetserver-56c4c9975-fkm2f -- r10k version'
        }
      }
    }
  }
}