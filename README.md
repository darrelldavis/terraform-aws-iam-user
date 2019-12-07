# terraform-aws-iam-user

Terraform module to provision IAM users, optionally creating API keys, console access and/or associate with (existing) groups.

## Prerequisites

* A recent (> 0.12.17) version of [Terraform](https://www.terraform.io/downloads.html).
* User groups must exist in IAM.

## Usage

Example usage:

```
module "users" {
  source = "git@github.com:darrelldavis/terraform-aws-iam-user?ref=master"

  users   = var.users
  pgp_key = var.pgp_key
}
```

## Variables

|  Name                        |  Default       |  Description                                                | Required |
|:-----------------------------|:--------------:|:------------------------------------------------------------|:--------:|
| users    |  | List of user attribute objects - see below.   | Yes      |
| pgp_key    |   | A base-64 encoded PGP public key, or a keybase username in the form keybase:username. Required to encrypt secrets.  | Yes      |
| tags    | {}  | Optional resource tags | No |

### User Attributes
Creation of a user is through the required users variable which is a list of user attribute objects. The table lists the valid attributes (note that this version of Terraform doesn not support optional object items so all must be listed for every user created. See https://github.com/hashicorp/terraform/issues/19898). See `terraform.tfvars.example` for examples.

| Name              | Type      | Description            |
|:------------------|:----------|:----------------------|
| name    | string | User name (e.g. "foo")  |
| path | string | Path in which to create the user |
| force_destroy | bool |When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed. |
| email | string | User email. Added to resource tags. |
| groups | list | User will be added as member to this list of groups. |
| console | bool | Whether user has console access. Creates a login profile with password. |
| api | bool | Whether user has AWS API access. Creates & manages API keys. |
| permission_boundary | string | The ARN of the policy that is used to set the permissions boundary for the user. | 


## Outputs

| Name              | Description            |
|:------------------|:----------------------|
| user_infos    | User attributes  |

## Related

* [https://github.com/darrelldavis/terraform-aws-iam-group](https://github.com/darrelldavis/terraform-aws-iam-group)

## Todo

* Add support to require MFA
* Input defaults and validations

## Authors

[Darrell Davis](https://github.com/darrelldavis)

## License

MIT Licensed. See LICENSE for full details.

