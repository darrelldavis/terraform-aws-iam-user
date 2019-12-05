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
| users    |  | Map of users and user attributes - see example.   | Yes      |
| pgp_key    |   | A base-64 encoded PGP public key, or a keybase username in the form keybase:username. Required to encrypt secrets.  | Yes      |
| tags    | {}  | Optional resource tags | No |

See `terraform.tfvars.example` for example users map.

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

