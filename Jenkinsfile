pipeline {
     agent any
     stages {
         stage('Build') {
             steps (tidyInstallationName: 'tidy-5.2.0', configId: null) {
                 sh 'tidy -v'
             }
         }
         stage('Lint HTML') {
               steps {
                   sh '/usr/bin/tidy -q -e *.html'
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