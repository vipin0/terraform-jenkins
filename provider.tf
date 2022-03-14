terraform {
  backend "s3" {
    bucket         = "vipin-terraform-state"
    key            = "tf-jenkins/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "vipin-tf-state-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.68.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region     = var.region
  
  default_tags {
    tags = var.default_tags
  }
}
