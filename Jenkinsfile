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
        
        docker.withRegistry('https://registry.hub.docker.com', 'docker') {
        def customImage = docker.build("my-image:${env.BUILD_ID}")
        /* Push the container to the custom Registry */
        docker.script.sh "docker pull $my-image:${env.BUILD_ID}"
        app.push("latest")     
        }
    }
}
