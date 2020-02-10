podTemplate {
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true)
    node(POD_LABEL) {
        stage('Run shell') {
            sh 'echo hello world'
            sh 'kubectl get pods'
        }
    }
}