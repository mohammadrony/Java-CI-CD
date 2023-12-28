pipeline {
  agent any
  triggers {
    pollSCM('H/2 * * * *')
  }
  
  tools {
    maven 'Maven_3'
  }

  environment {
      ec2_host = "100.100.100.100"
  }

  stages {
    stage('Git Clone') {
      steps {
        echo 'Pulling repository'
        git branch: 'aws', url: 'https://github.com/mohammadrony/Java-app-CI-CD-pipeline.git'
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
          sh "ssh-keygen -R ${ec2_host}"
          sh "scp -o StrictHostKeyChecking=no -i ${ec2_key_file} target/*.jar ec2-user@${ec2_host}:~/"
        }
      }
    }

    stage('Update Running App') {
      steps {
        withCredentials([sshUserPrivateKey(credentialsId: 'aws_ssh_key', keyFileVariable: 'ec2_key_file')]) {
          echo 'Start app in EC2'
          sh "ssh -i ${ec2_key_file} ec2-user@${ec2_host} 'pkill -9 java || true'"
          sh "ssh -i ${ec2_key_file} ec2-user@${ec2_host} 'nohup java -jar ~/spark-lms-*.jar > ~/log.txt 2>&1 &'"
        }
      }
    }
  }
}
