data "terraform_remote_state" "dev" {
  backend = "s3"
  config = {
    bucket         = "2025gorbucketfirsttime"  
    key            = "dev/terraform.tfstate"  
    region         = "us-east-1"  
    # dynamodb_table = "state_locks"
    # encrypt        = true
  }
}

data "terraform_remote_state" "prod" {
  backend = "s3"
  config = {
    bucket         = "2025gorbucketfirsttime"  
    key            = "prod/terraform.tfstate"  
    region         = "us-east-1"  
    # dynamodb_table = "state_locks"
    # encrypt        = true  
  }
}

data "terraform_remote_state" "staging" {
  backend = "s3"
  config = {
    bucket         = "2025gorbucketfirsttime"  
    key            = "staging/terraform.tfstate"  
    region         = "us-east-1"  
    # dynamodb_table = "state_locks"
    # encrypt        = true  
  }
}

# locals {
#     dev_outputs = data.terraform_remote_state.dev.outputs.dev_outputs
#     prod_outputs = data.terraform_remote_state.prod.outputs.prod_outputs
#     staging_outputs = data.terraform_remote_state.staging.outputs.staging_outputs
# }