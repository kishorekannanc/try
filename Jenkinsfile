pipeline {
  agent any 
  environment {
    DOCKER_CREDENTIALS = credentials('docker-hun-credentials')
   }

stages {
   stage('pull docker image') {
           steps {
              script {
          // login docker 
           withcredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')] {
            sh "docker login -u ${DOCKER_USERNAME} -P ${DOCKER_PASSWORD}"
            }

            // pull the latest images from docker hub with the prod tag
            sh "docker pull ${DOCKER_USERNAME}/prod:prod"
            }
          }
        }

    stages('stop & Remove old container') {
       steps {
          script {

             // stop and remove the old container
                 sh "docker stop devops-react-app-container || true"
                 sh "docker rm devops-react-app-container || true"
              }
            }
         }

       stages('deploy')
          steps {
              script {
                    sh "docker run -d --name devops-react-app-container -p 80:80 ${DOCKER_USERNAME}/prod:prod"
                  }
                }
              }
            }

     post {
         success {
               echo "successfull"
            }
          failure {
                echo "failed"
            }
         }
   }
