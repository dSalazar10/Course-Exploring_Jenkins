# Course-Exploring_Jenkins
Udacity Cloud DevOps Engineer Nano Degree Course 3

The command to log into the the Bastion using SSH:
`ssh ec2-user@18.236.152.223 -i bastion-key.pem`
(replce with public ip address)

To trasnfer a key over:
`scp -i bastion-key.pem jenkins-key.pem ec2-user@0.0.0.0:/home/ec2-user/jenkins-key.pem`
(replce 0.0.0.0 with public ip address)

To list docker containers:
`docker container ls`

To get initial admin password:
`docker exec aaaaaa00000 cat /var/jenkins_home/secrets/initialAdminPassword`
(replace aaaaaa00000 with Container ID)
