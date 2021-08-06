pipeline{
    agent any
        environment {
        PATH = "/opt/maven/bin:$PATH"
    }
    stages{
        stage("Git Checkout"){
            steps
            {
               git url: 'https://github.com/chandan09/pet-clinic.git'
            }
        }
        
        stage("Maven Build"){
            steps
            {
               sh "mvn clean package "
            }
        }
        
        stage('Docker Build'){
            steps{
                sh "docker build . -t chandan2018/petclinic:2.4.5 "
            }
        }
        
        
        stage('DockerHub Push'){
            steps{
                withCredentials([string(credentialsId: 'dockerhub_pwd', variable: 'DockerHubPwd')]) {
                    sh  "docker login -u chandan2018 -p ${DockerHubPwd}"
                }
                
                
                sh "docker push chandan2018/petclinic:2.4.5 "
            }
        }
        
        stage('Deploy Jar'){
            steps{
              
              ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, installation: 'Ansible', inventory: '/opt/ansible/inventory/aws_ec2.yaml', playbook: 'deploy-docker.yml'
             // ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, installation: 'ansible', inventory: 'host.inv', playbook: 'deploy-docker.yml'
            }
        }
    }
}
