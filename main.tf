terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.92"
    }
  }

  required_version = ">= 1.0"
}

provider "aws" {
  region  = "eu-north-1"
  profile = "imply"

  default_tags {
    tags = {
      "manage-by" = "terraform"
    }
  }
}

