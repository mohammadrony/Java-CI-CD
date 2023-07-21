pipeline {
  agent any
  triggers {
    pollSCM('H * * * *')
  }
  
  tools {
    maven 'Maven_3'
    git 'Git'
  }

  environment {
      ec2_host = "44.227.56.158"
  }

  stages {
    stage('Git Clone') {
      steps {
        echo 'Pulling repository'
        git branch: 'aws', credentialsId: 'gitlab_ssh_key', url: 'git@gitlab.com:gitlab-learning-projects/java-app-ci-cd-pipeline.git'
      }
    }

    stage('Build Artifact') {
      steps {
        echo 'Constructing artifact'
        sh 'mvn clean package'
      }
    }

    stage('Push app to EC2') {
      steps {
        withCredentials([sshUserPrivateKey(credentialsId: 'aws_ssh_key', keyFileVariable: 'ec2_key_file')]) {
          echo 'Deploy app to EC2 instance'
          sh "scp -o StrictHostKeyChecking=no -i ${ec2_key_file} target/*.jar ec2-user@${ec2_host}:~/"
        }
      }
    }

    stage('Update Running App') {
      steps {
        withCredentials([sshUserPrivateKey(credentialsId: 'aws_ssh_key', keyFileVariable: 'ec2_key_file')]) {
          echo 'Start app in EC2'
          sh "ssh -i ${ec2_key_file} ec2-user@${ec2_host} 'kill -9 java || true'"
          sh "ssh -i ${ec2_key_file} ec2-user@${ec2_host} 'nohup java -jar ~/spark-lms-*.jar > ~/log.txt 2>&1 &'"
        }
      }
    }
  }
}
