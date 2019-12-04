# terraform-aws-iam-user

Terraform module to provision IAM users, optionally creating API keys, console access and/or associate with (existing) groups.

## Requirements

A recent (> 0.12.17) version of [Terraform](https://www.terraform.io/downloads.html).

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
| users    |  | Map of users and attributes - see example.   | Yes      |
| pgp_key    |   | A base-64 encoded PGP public key, or a keybase username in the form keybase:username. Required to encrypt secrets.  | Yes      |

## Outputs

| Name              | Description            |
|:------------------|:----------------------|
| user_infos    | User attributes  |

## Todo

* Add support to require MFA 
* Input validations

## Authors

[Darrell Davis](https://github.com/darrelldavis)

## License

MIT Licensed. See LICENSE for full details.

