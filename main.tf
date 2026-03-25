terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.37.0"
    }
  }
}

provider "aws" {
    region     = "us-east-1"
    
}

resource "aws_s3_bucket" "example" {
  bucket = "shimmar-test-bucket"

  tags = {
    Name        = "My bucket"
    Environment = var.environment
  }
}