resource "aws_organizations_account" "account" {
  provider                   = "aws.master"
  email                      = "${var.aws_subaccount_email}"
  name                       = "${var.project_name}"
  iam_user_access_to_billing = "ALLOW"
  role_name                  = "MasterOrganizationAccount"

  lifecycle {
    ignore_changes = ["name", "email"]
  }
}

resource "aws_iam_account_alias" "account_alias" {
  provider      = "aws.subaccount"
  account_alias = "${replace("${var.org_rev_fqdn}.${var.project_prefix}", ".", "-")}"
}

resource "aws_key_pair" "masterkey" {
  provider   = "aws.subaccount"
  public_key = "${var.master_public_key_contents}"
  key_name   = "${var.project_prefix} masterkey"
}

// TODO remove eventually, used for (my) convenience
resource "aws_key_pair" "PVeretennikovs" {
  provider   = "aws.subaccount"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAqr5YHPYgJJwHRfw1+ySMoees2KAj4o3JCSc66PR1p8iZaAMAKNn7Z5XP03KLiu0UKZx8ceLWMY+fy7kE5pEVAjhqHxwBUjbdj32gDbTqX059dTF+UzTFZNxpZNA1nU9p5f4YqJeLrxLL0I7P/LVYLTaFTQYDwMYRBLmk3X3kQFyRLF6bKHrTkW8dBQeHPxhCdqlupj3uLyBcTR2qBaQrfCPvYP+9Bu2QfgMA8ex9YHfAzM8mAsgn1OxPEXe2KRIZZYo0vS3vLBRm7mmscWv6jxsw/GJd/0awKUyh6Yfw9U5Jry3neH7vuO7L6rmpPn3r3sTlLtijMfCUGCzDO2Vr+w== PVeretennikovs@riskfocus.com"
  key_name   = "PVeretennikovs"
}
