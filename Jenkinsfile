#!/usr/bin/env groovy

pipeline{
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_ACCESS_SECRET_KEY = credentials('aws_secret_access_key')
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
                sh('terraform plan -var region="$REGION" -var access_key="$AWS_ACCESS_KEY_ID" -var secret_key="$AWS_ACCESS_SECRET_KEY"')
            }
        }
        stage("Terraform apply"){
            steps{
                emailext body: '''Review terraform apply
                    ''', subject: 'Review Terraform Apply', to: 'vipin6673@gmail.com'
                script {

                    env.APPROVE = input message: 'Terraform apply ', ok: 'Continue',
                                parameters: [choice(name: 'Yes', choices: 'YES\nNO', description: 'Approve terraform apply ?')]
                    if (env.APPROVE == 'YES'){
                        sh ('terraform apply --auto-approve -var region="$REGION" -var access_key="$AWS_ACCESS_KEY_ID" -var secret_key="$AWS_ACCESS_SECRET_KEY"')
                    }else{
                        echo "Deployment Cancelled!!"
                    }
                }
            }
        }
    }
}