
terraform {
  required_version = "~> 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.20.0"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}
