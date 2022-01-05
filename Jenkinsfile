#!/usr/bin/env groovy

pipeline{
    agent any

    stages{
        stage("Terraform init"){
            steps{
                echo "Initializing Terraform"
                sh "terraform init"
            }
        }
        stage("Terraform plan"){
            steps{
                sh 'terraform plan -var region="us-east-1"'
            }
        }
        stage("Terraform apply"){
            steps{
                script {
                    env.APPROVE = input message: 'Terraform apply ', ok: 'Continue',
                                parameters: [choice(name: 'Yes', choices: 'YES\nNO', description: 'Approve terraform apply ?')]
                if (env.APPROVE == 'YES'){
                    sh 'terraform apply --auto-approve -var region="us-east-1"'
                }else{
                    echo "Deployment failed!"
                }
            }
            }
        }
    }
}