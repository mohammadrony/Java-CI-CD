pipeline {
  agent any
  triggers {
      pollSCM('H * * * *')
  }
  tools {
    maven 'MAVEN_3'
  }
  environment {
    DOCKERHUB_CREDS = 'docker_credentials'
    DOCKER_IMAGE = 'mohammadrony/java-library-app'
    REGISTRY = 'registry.hub.docker.com'
  }

  stages {
    stage('Git clone') {
      steps {
        echo 'Pulling repository'
        git branch: 'aws',url: 'https://github.com/mohammadrony-bjit/library-management-system.git'
      }
    }

    stage('Build artifact') {
        steps {
            echo 'Constructing artifact'
            sh 'mvn clean package'
        }
    }
    
    stage('Publish app to EC2') {
        steps {
            echo 'Pushing artifact to EC2'
        }
    }
  }
}