variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type      = string
  sensitive = true
}

variable "pm_api_token_secret" {
  type      = string
  sensitive = true
}

variable "ciuser" {
  type      = string
  sensitive = true
}

variable "cipassword" {
  type      = string
  sensitive = true
}

variable "sshkey" {
  type      = string
  sensitive = true
}
