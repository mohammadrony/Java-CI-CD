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
    stage('Git clone') {
      steps {
        echo 'Pulling repository'
        git branch: 'aws', url: 'https://github.com/mohammadrony-bjit/library-management-system.git'
      }
    }

    stage('Build artifact') {
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

    stage('Update running app') {
      steps {
        withCredentials([sshUserPrivateKey(credentialsId: 'aws_ssh_key', keyFileVariable: 'ec2_key_file')]) {
          echo 'Start app in EC2'
          
          sh 'sed -i "s/\\${ec2_host}/${ec2_host}/" start-app.sh'
          sh 'sed -i "s/\\${ec2_key_file}/${ec2_key_file}/" start-app.sh'
          sh "source ./start-app.sh"
        }
      }
    }
  }
}
