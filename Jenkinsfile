pipeline {
   
  agent none
  stages {
      steps {
        sh 'mvn clean install'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t guiumana/hygieia:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'dockerPassword', usernameVariable: 'dockerUser')]) {
          sh "docker login -u ${env.dockerUser} -p ${env.dockerPassword}"
          sh 'docker push guiumana/hygieia:latest'
        }
      }
    }
  }
}
