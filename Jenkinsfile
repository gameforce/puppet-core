pipeline {
  agent {
    def label = "worker-${UUID.randomUUID().toString()}"
    podTemplate(label: label, containers: [
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'r10k', image: 'puppet/r10k', command: 'cat', ttyEnabled: true)
    ]) {

  stages {
    stage('Check Kubernetes environments') {
      steps {
        container('kubectl') {
          script {
            PUPPET_CONTAINER = sh (script: "kubectl -n puppetr get pods --no-headers | grep cha-puppets | awk '{print \$1}'", returnStdout: true).trim()
          }
            print 'Lookup master pod name...'
            sh "echo ${PUPPET_CONTAINER}"
            print 'Checking namespace existence...'
            sh "kubectl get ns puppetserver"
        }
      }
    }
    
    stage('Run r10k puppetfile validation') {
      steps {
       container('r10k') {
            print 'Lookup master pod name...'
            sh "echo ${PUPPET_CONTAINER}"
            sh 'bash -c "cd /etc/puppetlabs/code/environments/$BRANCH_NAME/;r10k puppetfile check -v"'
          }
        }
      }

    stage('Discord Send') {
      steps {
            discordSend description: 'puppet-core', footer: 'footerlol', image: 'http://74.57.163.156/static/23b8663c/images/headshot.png', link: 'env.BUILD_URL', result: 'SUCCESS|UNSTABLE|FAILURE|ABORTED', thumbnail: '', title: 'env.JOB_NAME', webhookURL: 'https://discordapp.com/api/webhooks/682246868323139706/7oE92uLnkoIG-tfpPeGUUZLhW5CymU5f4bqjhDcbaNNfKSXgpSyEQaAOSwMh5tw_njIz'
          }
        }
      }
    }
  }
}
