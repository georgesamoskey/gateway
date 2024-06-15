pipeline {
  agent any
  stages {
    stage("Verifications des outils ") {
      steps {
        sh 'docker version'
        sh 'docker info'
        sh 'docker compose version'
        sh 'curl --version'
            }
        }

    stage(" Construction  d'image ") {
     steps {
             sh 'docker build -t  asyst-payall-gateway .'
        }
    }
    stage(" Deploiement de container ") {
     steps {
             sh 'docker compose up -d  --no-color --wait'
             sh 'docker compose ps'
        }
    }
    

  }

  post{
    always{
        sh 'docker compose ps'
    }
}
}