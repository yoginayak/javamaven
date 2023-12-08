pipeline{
    agent any

    tools {
         maven 'maven'
         jdk 'java'
    }

    stages{
        stage('checkout'){
            steps{
                #checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'github access', url: 'https://github.com/sreenivas449/java-hello-world-with-maven.git']]])
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/yoginayak/javamaven.git']])
            }
        }
        stage('build'){
            steps{
               bat 'mvn package'
            }
        }
        stage('build docker image'){
            steps{
                script{
                    sh 'docker build -t dockermaven/maven-integration .'
            
    }
}
