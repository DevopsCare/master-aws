
terraform {
  required_version = ">= 0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>3.12" # tested with v3.12.0
    }
    local = {
      source = "hashicorp/local"
    }
  }
}
