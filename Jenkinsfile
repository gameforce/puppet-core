#!/usr/bin/env groovy

pipeline {
  agent {
    kubernetes {
      label 'kube-test' // this label value will be displayed in the Jenkins UI in the node section.  It should be descriptive and convey what is building.
      defaultContainer 'jnlp' // this parameter specifies which container in the pod is responsible to establish the connection with Jenkins.
      yamlFile 'KubernetesPod.yaml'
    }
  }
  stages {
    stage('Run maven') {
      steps {
        container('maven') {
          sh 'mvn -version'
        }
        container('busybox') {
          sh '/bin/busybox'
        }
      }
    }
  }
  discordSend link: 'env.BUILD_URL', result: currentBuild.currentResult, title: 'env.JOB_NAME', webhookURL: "https://discordapp.com/api/webhooks/682246868323139706/7oE92uLnkoIG-tfpPeGUUZLhW5CymU5f4bqjhDcbaNNfKSXgpSyEQaAOSwMh5tw_njIz"
}
