pipeline{
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = 'your-dockerhub-credentials-id'
        DOCKERHUB_USERNAME = 'your-dockerhub-username'
        DOCKERHUB_REPOSITORY = 'your-dockerhub-repository'
        DOCKER_IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    tools {
         maven 'Maven'
    }

    stages{
        stage('checkout'){
            steps{
                // checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github access', url: 'https://github.com/sreenivas449/java-hello-world-with-maven.git']]])
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yoginayak/javamaven.git']])
            }
        }
        stage('build'){
            steps{
               sh 'mvn package'
            }
        } 

       stage('build docker image'){
            steps{
                script{
                    sh 'docker build -t dockermaven/maven-integration .'
                }
            }
       }
        
        stage('push dockerhub'){
            steps{
               // withCredentials([string(credentialsId: 'dockerhub', variable: 'dockpwd')]) {
		withCredentials([string(credentialsId: 'dockerhub', variable: 'docpd')]) {
                sh 'docker  login -u yoginayak1@gmail.com -p Guru@7760 docker.io'
                sh 'docker push yogi7760/dockermaven/maven-integration'
                }
     
            }
        }
 
    }
	
}
