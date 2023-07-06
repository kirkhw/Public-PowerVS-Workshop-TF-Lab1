# Readded Cloud API Key to run from Cloud UI
# Cloud API Key
variable "ibm_cloud_api_key" {
  type        = string
  description = "IBM Cloud API key"
}

#PowerVS Variables
variable "powervs_workspace_name" {
  description = "Name of the PowerVS workspace to use."
  type        = string
  default     = ""
}

variable "ibm_cloud_zone" {
  description = "IBM Cloud zone [syd04|05, eu-de-1|2, lon04|06, wdc04|06|07, us-east, us-south, dal10|12|13, tor01, tok04, osa21, sao01, mon01]."
  type        = string
  default     = ""
  validation {
    condition     = contains(["syd04", "syd05", "eu-de-1", "eu-de-2", "lon04", "lon06", "wdc04", "us-east", "us-south", "dal12", "dal13", "tor01", "tok04", "osa21", "sao01", "mon01"], var.ibm_cloud_zone)
    error_message = "Only Following DC values are supported :  syd04, syd05, eu-de-1, eu-de-2, lon04, lon06, wdc04, us-east, us-south, dal12, dal13, tor01, tok04, osa21, sao01, mon01"
  }
}

variable "powervs_new_vm_name" {
  description = "Name of new VM to create"
  type        = string
  default     = ""
}

variable "powervs_sshkey_name" {
  description = "Name of IBM Cloud PowerVS SSH Key to use."
  type        = string
  default     = ""
}

variable "powervs_region" {
  description = "IBM Cloud PowerVS region [syd,eu-de,lon,us-east,us-south,tor,tok]"
  type        = string
  default     = ""
  validation {
    condition     = contains(["syd", "eu-de", "lon", "us-east", "us-south", "tor", "tok"], var.powervs_region)
    error_message = "Only Following PowerVS regions values are supported :  syd, eu-de, lon, us-east, us-south, tor and tok"
  }
}

variable "ibm_cloud_resource_group_name" {
  description = "Existing IBM Cloud resource group name."
  type        = string
  default     = "default"
}

variable "powervs_public_network_name" {
  description = "Name of the public network to create."
  type        = string
  default     = ""
}


variable "powervs_image_name" {
  description = "List of Images to be imported into cloud account from catalog images."
  type        = string
  default     =""
}
