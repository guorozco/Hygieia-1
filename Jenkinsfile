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
	  sh 'ssh -t root@18.217.186.86 "docker run -t -p 8080:8080 -v -e "SPRING_DATA_MONGODB_HOST=127.0.0.1" -e "xFjy+TYrLHwDbLw7kl7HvZDL1vCfm2gV=hygieiasecret" -i guiusertest/hygieia2:latest"'
    }
}
