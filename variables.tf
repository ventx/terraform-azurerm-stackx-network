variable "name" {
  description = "Base Name for all resources (preferably generated by terraform-null-label)"
  type        = string
  default     = "stackx-network"
}

variable "tags" {
  description = "User specific Tags / Labels to attach to resources (will be merged with module tags)"
  type        = map(string)
  default     = {}
}

variable "static_unique_id" {
  description = "Static unique ID, defined in the root module once, to be suffixed to all resources for uniqueness (if you choose uuid / longer id, some resources will be cut of at max length - empty means disable and NOT add unique suffix)"
  type        = string
  default     = ""
}

variable "rg_name" {
  description = "Name of Azure Resource Group"
  type        = string
}

variable "region" {
  description = "AKS region (e.g. `West Europe`) -> `az account list-locations --output table`"
  type        = string
  default     = "Germany West Central"
}

variable "number_azs" {
  description = "Number of Availability Zones"
  type        = number
  default     = 3
  validation {
    condition     = can(regex("^1|2|3", var.number_azs))
    error_message = "The number_azs value must be >=1 and <= 3."
  }
}


# --------------------------------------------------------------------------
# VPC
# --------------------------------------------------------------------------
variable "vpc_cidr_kubevnet" {
  description = "spoke1-kubevnet Azure Virtual Network VPC CIDR network block (e.g. `10.1.0.0/16`)"
  type        = string
  default     = "10.10.0.0/16"
}

variable "vpc_cidr_hub" {
  description = "hub1-firewalvnet Azure Virtual Network VPC CIDR network block (e.g. `10.1.0.0/16`)"
  type        = string
  default     = "10.20.0.0/16"
}


variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  type        = bool
  default     = false
}