output "users_infos" {
value = <<EOT

%{ for user in var.users }
----------------------------------
Console: https://${data.aws_caller_identity.aws.account_id}.signin.aws.amazon.com/console
Username: ${user.name}
Password: %{ if tobool(user.console) }${aws_iam_user_login_profile.profile[user.name].encrypted_password} 

    To decrypt: echo "${aws_iam_user_login_profile.profile[user.name].encrypted_password}" | base64 --decode | keybase pgp decrypt%{ else }-- no access --%{ endif }

API access key id: %{ if tobool(user.api) }${aws_iam_access_key.accesskey[user.name].id} %{ else }-- no access --%{ endif }
API access secret: %{ if tobool(user.api) }${aws_iam_access_key.accesskey[user.name].encrypted_secret}

    To decrypt: echo "${aws_iam_access_key.accesskey[user.name].encrypted_secret}" | base64 --decode | keybase pgp decrypt%{ else }-- no access --%{ endif }

%{ endfor }

EOT

}
