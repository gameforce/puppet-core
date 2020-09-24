@Library('puppet-jenkins-shared-libraries@#4_ruby_version branch')
/* Using a version specifier, such as branch, tag, etc */
puppet {
  PUPPET_VERSION = '6'
  RUBY_VERSION = 'ruby-2.3.0'
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