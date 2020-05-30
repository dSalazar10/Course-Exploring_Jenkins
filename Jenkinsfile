pipeline {
     agent any
     environment {
        PATH = "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
     }
     stages {
         stage('Build') {
             steps {
                 sh 'echo "Hello World!"'
                 sh 'echo $PATH'
                 sh 'which tidy'
                 sh '''
                     echo "Multiline shell steps works too"
                     ls -lah
                 '''
             }
         }
         stage('Lint HTML') {
               steps {
                   sh 'tidy -q -e *.html'
               }
         }
         stage('Security Scan') {
               steps { 
                  aquaMicroscanner imageName: 'alpine:latest', onDisallowed: 'fail', notCompliesCmd: 'exit 1', outputFormat: 'html'
               }
          } 
         stage('Upload to AWS') {
              steps {
                  withAWS(region:'us-west-2',credentials:'aws-static') {
                  sh 'echo "Uploading content with AWS creds"'
                      s3Upload(pathStyleAccessEnabled: true, payloadSigningEnabled: true, file:'index.html', bucket:'jenkinsserver-s3bucket-1wmpih18yitww')
                  }
              }
         }
     }
}