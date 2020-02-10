podTemplate(label: 'jnlp', containers: [
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.0', command: 'cat', ttyEnabled: true),
    ],
  volumes: [
    hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  ]) {
    node('jnlp') {

        stage('do some kubectl work') {
            container('kubectl') {
                    sh "kubectl get nodes"
                }
            }
        }
}