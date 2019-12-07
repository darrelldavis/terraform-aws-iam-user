variable "users" {
  description = "Users and user attributes - see docs for example"
  type        = list(object({
    name                 = string
    path                 = string
    force_destroy        = bool
    email                = string
    groups               = list(string)
    console              = bool
    api                  = bool
    permissions_boundary = string
  }))
}

variable "pgp_key" {
  description = "A base-64 encoded PGP public key, or a keybase username in the form keybase:username. Required to encrypt secrets."
  type        = string
}

variable "password_length" {
  description = "The length of the generated password on resource creation."
  type        = number
  default     = 14
}

variable "password_reset_required" {
  description = "Whether the user should be forced to reset the generated password on resource creation. "
  type        = bool
  default     = true
}

variable "tags" {
  description = "Optional resource tags"
  type        = map
  default     = {}
}
