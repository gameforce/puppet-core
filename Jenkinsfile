podTemplate {
  containerTemplate(name: 'kubectl', image: 'jenkinsci/jnlp-slave')
    node(POD_LABEL) {
        stage('Run shell') {
            sh 'echo hello world'
            sh 'kubectl get pods'
        }
    }
}