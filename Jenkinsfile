#!/usr/bin/env groovy

pipeline{
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws_access_key_id')
        AWS_ACCESS_SECRET_KEY = credentials('aws_secret_access_key')
        VAR_FILE = credentials('terraform-variables')
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
                sh('terraform plan --var-file="$VAR_FILE"')
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
                        // sh ('terraform apply --auto-approve -var region="$REGION" -var key_name="$KEY_NAME"')
                        sh ('terraform apply --auto-approve --var-file="$VAR_FILE"')
                    }else{
                        echo "Deployment Cancelled!!"
                    }
                }
            }
        }
    }
}