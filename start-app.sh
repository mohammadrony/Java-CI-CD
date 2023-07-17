ssh -i ${ec2_key_file} ec2-user@${ec2_host} "pkill -9 -f 'java -jar'"
ssh -i ${ec2_key_file} ec2-user@${ec2_host} "nohup java -jar ~/*.jar > ~/log.txt 2>&1 &"
