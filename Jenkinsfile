podTemplate(label: 'jenkins-robot', containers: [
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.0', command: 'cat', ttyEnabled: true),
    ],) {
node {
  stage('List pods') {
    withKubeConfig([credentialsId: '47de721e-510d-44c2-a26f-2421dfe348bc',
                    serverUrl: 'https://192.168.11.20:6443',
                    namespace: 'puppetserver'
                    ]) {
      sh 'kubectl get pods'
    }
  }
}