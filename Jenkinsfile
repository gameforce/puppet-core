puppet {
  PUPPET_VERSION = '6'
  RUBY_VERSION = 'ruby-2.3.8'
  RUBY_GEMSET = 'puppet'
  TEST_RESULTS_DIR = 'testresults'
  RUN_ACCEPTANCE = 'true'
  ACCEPTANCE_TESTS = [
    'Ubuntu-1404 Puppet-1.6.2': {
      puppetRvm('PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=1.6.2 BEAKER_set=ubuntu-1404-docker rake acceptance')
    },
    'Ubuntu-1604 Puppet-1.6.2': {
      puppetRvm('PUPPET_INSTALL_TYPE=agent PUPPET_INSTALL_VERSION=1.6.2 BEAKER_set=ubuntu-1604-docker rake acceptance')
    },
    failFast: false
  ]
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