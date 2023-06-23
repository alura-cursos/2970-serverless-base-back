terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.1"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  region  = "us-east-1"
}
