terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.0.0"
    }
  }

  backend "s3" {  
    bucket         = "2025gorbucketfirsttime"  
    key            = "prod/terraform.tfstate"  
    region         = "us-east-1"  
    dynamodb_table = "state_locks"
    encrypt        = true  
  } 
}