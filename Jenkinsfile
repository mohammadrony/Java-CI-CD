pipeline {
  agent any
  triggers {
      pollSCM 'H * * * *'
  }
  tools {
    maven "MAVEN_3"
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
        git branch: 'main',url: 'https://github.com/mohammadrony/Java-app-CI-CD-pipeline.git'
      }
    }
    
    stage('Build artifact') {
        steps {
            echo 'Constructing artifact'
            sh 'mvn clean package'
        }
    }

    stage('Building image') {
      steps {
        script {
          app_image = docker.build("${REGISTRY}/${DOCKER_IMAGE}")
        }
      }
    }
    stage('Push Docker Image') {
      steps{
        script {
          docker.withRegistry("https://${REGISTRY}", DOCKERHUB_CREDS) {
            app_image.push("${BUILD_NUMBER}")
            app_image.push("latest")
          }
        }
      }
    }
    
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi ${REGISTRY}/${DOCKER_IMAGE}:latest"
        sh "docker rmi ${REGISTRY}/${DOCKER_IMAGE}:${BUILD_NUMBER}"
      }
    }
    
    stage("Deploy containers"){
      steps{
        script {
          sh """#!/bin/sh
            BUILD_NUMBER=26

            echo "Creating config map and secrets"
            /usr/local/bin/kubectl apply -f ./1-app-config-and-secret.yml

            echo "Creating storage for mysql"
            /usr/local/bin/kubectl apply -f ./2-mysql-pv-pvc.yml

            echo "Creating mysql pod and service"
            /usr/local/bin/kubectl apply -f ./3-mysql-pod-service.yml

            echo "Creating java app deployments"
            /usr/local/bin/kubectl apply -f ./4-java-app-deploy.yml
          """
        }
      }
    }
  }
}
