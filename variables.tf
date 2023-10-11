variable "name" {
  type        = string
  default     = "anuchunduridevops"
  description = "Prefix of name for resources"
}
variable "location" {
  type        = string
  default     = "swedencentral"
  description = "Azure location for services"
}

variable "vm_size" {
  type        = number
  description = "AKS cluster VM size"
}

variable "ssh_public_key" {
  type        = string
  description = "SSH key to access AKS cluster"
}

variable "devopspool_count" {
  type        = number
  description = "No of nodes in AKS Cluster"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Azure VNET Address Space"
}

variable "aks_subnet_address_prefix" {
  type        = string
  description = "AKS Subnet Address prefix"
}
