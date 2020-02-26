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

discordSend link: 'env.BUILD_URL', result: currentBuild.currentResult, title: 'env.JOB_NAME', webhookURL: ""
