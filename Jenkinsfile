pipeline{
    agent any

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
                sh 'docker  login -u yoginayak1@gmail.com -p ${dockpwd}'
                sh 'docker push dockermaven/maven-integration'
                }
     
            }
        }
 
    }
	
}
