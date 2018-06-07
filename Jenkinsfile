node {
    def app
    
    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        checkout scm
    }
    
     stage('Build code') {
        sh "mvn clean install"
    }

    stage('Build image') {
       sh "docker-compose build"
    }

    stage('Push image') {
          withDockerRegistry([ credentialsId: "docker", url: "https://registry.hub.docker.com" ]) {
          sh 'docker login'
          sh 'docker tag hygieia-score-collector:latest guiumana/hygieia3'
          sh 'docker push guiumana/hygieia3'               
        }
    }
}
