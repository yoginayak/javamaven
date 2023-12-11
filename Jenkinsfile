pipeline{
    agent any

     environment {
        AWS_ACCOUNT_ID="664334749222"
        AWS_DEFAULT_REGION="eu-north-1"
        IMAGE_REPO_NAME="dockermaven"
        IMAGE_TAG="latest"
        REPOSITORY_URI = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}"
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
		sh 'docker tag dockermaven/maven-integration yogi7760/dockerhub:mylastimagepush'
		sh 'docker push yogi7760/dockerhub:mylastimagepush'
                //sh 'docker push yogi7760/dockermaven/maven-integration'
                }
     
            }
        }
	    
	 stage('Logging into AWS ECR') {
            steps {
                script {
                sh "aws ecr get-login-password --region ${AWS_DEFAULT_REGION} | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com"
                }
                 
            }
        }
	 // Uploading Docker images into AWS ECR
         stage('Pushing to ECR') {
             steps{  
                 script {
                     sh "docker tag dockermaven/maven-integration:latest ${REPOSITORY_URI}:latest"
                     sh "docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_DEFAULT_REGION}.amazonaws.com/${IMAGE_REPO_NAME}:latest"
                 }
             }
       }
 
    }
	
}
