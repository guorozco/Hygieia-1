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
          sh 'docker tag hygieia-score-collector:latest guiusertest/hygieia2'
          sh 'docker push guiusertest/hygieia2'
        }
    }
   stage('Swarm service start') {  
	  sh 'ssh -t root@18.217.186.86 "docker service create guiusertest/hygieia2"' 
    }
}
