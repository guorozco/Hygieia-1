node {
    def app
    def customImage

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
          sh 'docker push guiumana/hygieia-api-audit:latest'               
        }
    }
}
