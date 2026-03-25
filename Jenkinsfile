pipeline {

    agent any

    parameters {

        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select environment')

    }

    environment {

        AWS_DEFAULT_REGION = 'us-east-1'

    }

    stages {

        stage('Checkout') {

            steps {

                git branch: 'main', url: 'https://github.com/shimmar8/CICD-Shimmar.git'

            }

        }

        stage('Terraform Init') {

            steps {

                sh 'terraform init'

            }

        }

        stage('Terraform Plan') {

            steps {

                sh "terraform plan -var-file=${params.ENV}.tfvars -out=tfplan"

            }

        }

        stage('Terraform Apply') {

            steps {

                sh 'terraform apply -auto-approve tfplan'

            }

        }

    }

}
 
