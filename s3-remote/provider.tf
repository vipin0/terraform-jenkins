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
  profile = var.credential_profile
  default_tags {
   tags = {
     Environment = "Test"
     Owner       = "TFProviders"
     Project     = "Test"
   }
 }
}