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
	  sh 'docker login -u guiusertest -p Password1' 
          sh 'docker tag hygieia-score-collector:latest $USERNAME/hygieia2'
          sh 'docker push $USERNAME/hygieia2'
		  
			 }

    }
}
