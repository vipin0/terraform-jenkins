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
        stage("Terraform apply"){
            steps{
                script {
                    env.APPROVE_QA = input message: 'Terraform apply ', ok: 'Continue',
                                parameters: [choice(name: 'Yes', choices: 'YES\nNO', description: 'Approve terraform apply ?')]
                if (env.APPROVE_QA == 'YES'){
                    sh "terraform apply --auto-approve"
                }else{
                    echo "Deployment failed!"
                }
            }
            }
        }
    }
}