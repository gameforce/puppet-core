podTemplate(label: 'builder', containers: [
    containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.0', command: 'cat', ttyEnabled: true),
    ],) {

    node('jnlp') {

        stage('do some kubectl work') {
            container('kubectl') {
                    sh "kubectl -n puppetserver exec -it puppetserver-puppetserver-helm-cha-puppetserver-56c4c9975-fkm2f -- r10k puppetfile validate -v"
                }
            }
        }
}