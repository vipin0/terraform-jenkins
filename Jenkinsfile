#!/usr/bin/env groovy

pipeline{
    agent any

    environment {
        REGION = 'us-east-1'
    }

    stages{
        stage("Terraform init"){
            steps{
                echo "Initializing Terraform"
                sh "terraform init"
            }
        }
        stage("Terraform plan"){
            steps{
                sh('terraform plan -var region="$REGION"')
            }
        }
        stage("Terraform apply"){
            steps{
                script {
                    env.APPROVE = input message: 'Terraform apply ', ok: 'Continue',
                                parameters: [choice(name: 'Yes', choices: 'YES\nNO', description: 'Approve terraform apply ?')]
                if (env.APPROVE == 'YES'){
                    sh ('terraform apply --auto-approve -var region="$REGION"')
                }else{
                    echo "Deployment failed!"
                }
            }
            }
        }
    }
}