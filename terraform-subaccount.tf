//noinspection MissingModule
module "terraform_state_backend" {
  source      = "git::https://github.com/cloudposse/terraform-aws-tfstate-backend.git?ref=tags/0.33.0"
  namespace   = var.org_rev_fqdn
  environment = var.project_prefix
  name        = "terraform"
  attributes  = ["state"]

  block_public_acls       = true
  block_public_policy     = true
  restrict_public_buckets = true

  billing_mode = "PAY_PER_REQUEST"

  providers = {
    aws = aws.subaccount
  }
}

output "tf_backend_config" {
  value = module.terraform_state_backend.terraform_backend_config
}

