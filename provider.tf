terraform {
  backend "s3" {
    bucket = "738870854418-terraform-tfstate"
    key = "main/dev/terraform.tfstate"
    region = "eu-central-1"
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}