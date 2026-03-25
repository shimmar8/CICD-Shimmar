pipeline{
    agent any
    
    parameters {
        choice(name : 'ENV', choices: ['dev', 'prod'], description : 'Select environment')
    }
    
    stages {
        stage('Terraform init') {
            steps{
                sh 'terraform init'
            }
        }
    }
        stage('Terraform plan') {
            steps {
                sh 'terraform plan -var='environment=${params.ENV}' -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps{
                sh 'terraform apply -auto-approve tfplan'
            }
        }
}