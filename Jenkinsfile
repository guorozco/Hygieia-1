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
          sh 'docker login -u guiumana -p GU8605or' 
          sh 'docker tag hygieia-score-collector:latest $USERNAME/hygieia2'
          sh 'docker push $USERNAME/hygieia2'
    }
}
