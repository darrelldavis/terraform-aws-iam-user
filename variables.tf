variable "users" {
  description = "Map of users and attributes - see docs for example"
  type        = map
}

variable "pgp_key" {
  description = "A base-64 encoded PGP public key, or a keybase username in the form keybase:username. Required to encrypt secrets."
  type        = string
}

variable "tags" {
  description = "Optional resource tags"
  type        = map
  default     = {}
}
