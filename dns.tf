module "primary_label" {
  source  = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.22.0"
  context = module.base_label.context
  name    = "dns"
}

resource "aws_route53_zone" "primary" {
  provider = aws.subaccount
  name     = "${var.project_prefix}.${var.org_fqdn}"
  tags     = module.primary_label.tags
}

