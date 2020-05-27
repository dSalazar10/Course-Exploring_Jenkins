# Course-Exploring_Jenkins
Udacity Cloud DevOps Engineer Nano Degree Course 3

The source code has two AWS CloudFormation scripts:
1) Network
- This will setup a VPC with 2 Availbility Zones, each containing 2 subnets and one NAT Gateway
2) Jenkins Server
- This will create an Ubuntu Instance for use with Jenkins

The command to log into the the server using SSH:

`ssh ubuntu@0.0.0.0 -i jenkins-key.pem`

(repalce 0.0.0.0 with the public ip address of the EC2 Instance)

Note: For security purposes, you could replace the CIDR blocks on the ingress/egress of the Jenkins
Security Group from 0.0.0.0/0 to your computer's public IP address.
