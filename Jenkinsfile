pipeline {
  agent {
    kubernetes {
      //cloud 'kubernetes'
      yaml """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: r10kdep
    image: darf/r10kdep:v1.1
    command: ['cat']
    tty: true
"""
    }
  }

  stages {
    stage('Check Kubernetes environments') {
      steps {
        container('r10kdep') {
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
    
    stage('R10K check environments') {
      steps{
        container('r10kdep') {
          print 'Lookup master pod name...'
          sh "echo ${PUPPET_CONTAINER}"
          print 'Sync environments with r10k...'

          sh(script: "kubectl -n puppetserver -i ${PUPPET_CONTAINER} -- bash -c 'cd /etc/puppetlabs/code/environments/$BRANCH_NAME/;r10k deploy environment'", returnStdout:true)
        }
      }
    }
    
    stage('Run r10k puppetfile validation') {
      steps {
        container('r10kdep') {
          sh 'kubectl -n puppetserver exec -i $(PUPPET_CONTAINER) -- bash -c "cd /etc/puppetlabs/code/environments/$BRANCH_NAME/;r10k puppetfile check -v"'
          sh 'kubectl -n puppetserver exec -i $(PUPPET_CONTAINER) -- bash -c "cd /etc/puppetlabs/code/environments/$BRANCH_NAME/;r10k puppetfile install --force -v"'
        }
      }
    }
  }
}