<<<<<<< HEAD
def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'helm', image: 'lachlanevenson/k8s-helm:latest', command: 'cat', ttyEnabled: true),
    containerTemplate(name: 'r10k', image: 'puppet/r10k', command: 'cat', ttyEnabled: true)
  ]) {
    node(label) {
        container('kubectl') {
            stage('Run Command') {
                sh 'kubectl get pods -n puppet'
            }
        }
    }
}

discordSend link: 'env.BUILD_URL', result: currentBuild.currentResult, title: 'env.JOB_NAME', webhookURL: "https://discordapp.com/api/webhooks/682246868323139706/7oE92uLnkoIG-tfpPeGUUZLhW5CymU5f4bqjhDcbaNNfKSXgpSyEQaAOSwMh5tw_njIz"
=======
/* @Library('puppet-jenkins-shared-libraries@#4_ruby_version branch') */
/* Using a version specifier, such as branch, tag, etc                */
puppet {
  PUPPET_VERSION = '6'
  RUBY_VERSION = 'ruby-2.7.1'
  RUBY_GEMSET = 'puppet'
  TEST_RESULTS_DIR = 'testresults'
  RUN_ACCEPTANCE = 'false'
  ACCEPTANCE_TESTS = 'false'
  DEPLOY_WITH_R10K = 'true'
  R10K_DEPLOY_URL = 'http://vip.gameforce.net:8088'
  R10K_DEPLOY_BASIC_AUTH_CRED_ID = ''
  R10K_DEPLOY_BRANCH = ['production', 'staging']
  SLACK_CHANNEL = '#puppet'
  DEBUG = 'true'
  DOCKER_REGISTRY_CREDS_ID = ''
  DOCKER_REGISTRY_URL = 'https://hub.docker.io'
  AWS_DEFAULT_REGION = 'us-east-1'
}
>>>>>>> production
