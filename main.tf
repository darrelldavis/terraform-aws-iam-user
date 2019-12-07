
# Create IAM user 

resource "aws_iam_user" "user" {
  for_each = {for user in var.users: user.name => user}

  name          = each.key
  path          = each.value["path"]
  force_destroy = each.value["force_destroy"]

  permissions_boundary = each.value["permissions_boundary"]

  tags = merge(var.tags, map("EmailAddress", each.value["email"]))
}

# Create list of users with API access
locals {
  api_users = [
    for user in var.users:
      user.name if tobool(user.api)
  ]
}

# Create API keys
resource "aws_iam_access_key" "accesskey" {
  for_each = toset(local.api_users)

  user    = each.key
  pgp_key = var.pgp_key

  depends_on = [ aws_iam_user.user ]
}

# Create list of users with console access
locals {
  console_users = [
    for user in var.users:
      user.name if tobool(user.console)
  ]
}

# For console URL
data "aws_caller_identity" "aws" {}

# Create console login profile
resource "aws_iam_user_login_profile" "profile" {
  for_each = toset(local.console_users)
 
  user    = each.key
  pgp_key = var.pgp_key

  password_length = var.password_length

  password_reset_required = var.password_reset_required

  depends_on = [ aws_iam_user.user ]

  lifecycle {
    ignore_changes = [ password_length, password_reset_required, pgp_key ]
  }
}

# Add users to existing group(s)
resource "aws_iam_user_group_membership" "group" {
  for_each = {for user in var.users: user.name => user}
  #for_each = var.users

  user   = each.key
  groups = each.value["groups"]

  depends_on = [ aws_iam_user.user ]
}
