terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region  = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  default_tags {
   tags = {
     Environment = "Test"
     Owner       = "TFProviders"
     Project     = "Test"
   }
 }
}