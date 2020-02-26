pipeline {
  podTemplate(label: label, containers: containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true))
    stages {
        stage('build') {
          container(docker) {
            steps {
                sh 'mvn --version'
        }
      }
    }
  }
}
