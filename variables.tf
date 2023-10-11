variable "name" {
	type = string
	default = "anuchunduridevops"
	description = "Prefix of name for resources"
}
variable "location" {
	type = string
	default = "swedencentral"
	description = "Azure location for services"
}

variable "vm_size" {
}

variable "ssh_public_key" {
}

variable "devopspool_count" {
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Azure VNET Address Space"
}

variable "aks_subnet_address_prefix" {
  type        = string
  description = "AKS Subnet Address prefix"
}