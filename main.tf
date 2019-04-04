provider "aws" {
  alias  = "subaccount"
  region = "${var.aws_region}"

  assume_role {
    role_arn = "arn:aws:iam::${aws_organizations_account.account.id}:role/${aws_organizations_account.account.role_name}"
  }
}

module "base_label" {
  source              = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.7.0"
  namespace           = "${var.org_rev_fqdn}"
  environment         = "${var.project_prefix}"
  regex_replace_chars = "/[^a-zA-Z0-9-.]/"
  delimiter           = "."
}
