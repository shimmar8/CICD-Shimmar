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

                bat 'terraform init'

            }

        }

        stage('Terraform Plan') {

            steps {

                withCredentials([[

                    $class: 'AmazonWebServicesCredentialsBinding',

                    credentialsId: 'aws-access-key'

                ]]) {

                    bat "terraform plan -var-file=${params.ENV}.tfvars"

                }

            }

        }

        stage('Terraform Apply') {

            steps {

                withCredentials([[

                    $class: 'AmazonWebServicesCredentialsBinding',

                    credentialsId: 'aws-access-key'

                ]]) {

                    bat "terraform apply -auto-approve -var-file=${params.ENV}.tfvars"

                }

            }

        }

    }

}
 
