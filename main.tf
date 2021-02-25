provider "aws" {
  region                      = "us-east-1"
  access_key                  = "123"
  secret_key                  = "xyz"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  endpoints {
    ecr    = "http://localhost:4566"
    iam    = "http://localhost:4566"
    lambda = "http://localhost:4566"
  }
}
