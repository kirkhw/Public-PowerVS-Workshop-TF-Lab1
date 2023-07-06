# Required providers, including IBM Cloud
terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">=1.49.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.9.1"
    }
  }
}