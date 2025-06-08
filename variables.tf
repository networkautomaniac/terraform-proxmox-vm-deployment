# Credentials
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

# VM Configuration
variable "target_node" {
  type = string
}

variable "name" {
  type = string
}

variable "clone" {
  type = string
}

variable "full_clone" {
  type = bool
}

variable "os_type" {
  type = string
}

variable "memory" {
  type = number
}

variable "balloon" {
  type = number
}

variable "cpu_cores" {
  type = number
}

variable "cpu_sockets" {
  type = number
}

variable "cpu_type" {
  type = string
}

variable "machine" {
  type = string
}

variable "scsihw" {
  type = string
}

variable "cloudinit_storage" {
  type = string
}

variable "disk_size" {
  type = number
}

variable "disk_cache" {
  type = string
}

variable "disk_storage" {
  type = string
}

variable "disk_discard" {
  type = bool
}

variable "disk_emulatessd" {
  type = bool
}

variable "disk_iothread" {
  type = bool
}

variable "disk_replicate" {
  type = bool
}

variable "network_id" {
  type = number
}

variable "network_model" {
  type = string
}

variable "network_bridge" {
  type = string
}

variable "network_tag" {
  type = number
}

variable "network_firewall" {
  type = bool
}

variable "serial_id" {
  type = number
}

variable "serial_type" {
  type = string
}

variable "ciupgrade" {
  type = bool
}

# Options Configuration
variable "boot" {
  type = string
}

variable "agent" {
  type = number
}
