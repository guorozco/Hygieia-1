node {
    def app
    def DOCKER_ID_USER = "guiumana"

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
          sh 'docker tag hygieia-score-collector:latest ${DOCKER_ID_USER}/hygieia'
          sh 'docker push ${DOCKER_ID_USER}/hygieia'               
        }
    }
}
