terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "mel-ciscolabs-com"
    workspaces {
      name = "ndfc-acl-demo-1"
    }
  }
  required_providers {
    dcnm = {
      source = "CiscoDevNet/dcnm"
      # version = "0.0.5"
    }
  }
}

## If using DCNM to assign VNIs use -parallelism=1

provider "dcnm" {
  username = var.dcnm_user
  password = var.dcnm_password
  url      = var.dcnm_url
  insecure = true
  platform = var.platform
}

module "test-acl" {
  source = "github.com/cisco-apjc-cloud-se/terraform-dcnm-acl"

  content   = var.content
  switches  = {
    DC1-LEAF-1 = {
      name = "DC1-LEAF-1"
      fabric = "CML2-DC1"
    }
    DC1-LEAF-2 = {
      name = "DC1-LEAF-2"
      fabric = "CML2-DC1"
    }
  }
}
