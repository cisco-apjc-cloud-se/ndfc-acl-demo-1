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

## Example 1 - Single ACL Inline ##

module "test-acl" {
  source  = "terraform-cisco-modules/freeform/dcnm"
  version = "1.0.0"

  content = <<-EOT
  ip access-list TF-TEST-ACL
    10 permit ip any any
    20 permit ip 1.1.1.1/32 2.2.2.2/32
  EOT
  switches  = {
    DC1-LEAF1 = {
      name = "DC1-LEAF1"
      fabric = "AUTOMATION-LAB-DC1"
    }
    DC1-LEAF2 = {
      name = "DC1-LEAF2"
      fabric = "AUTOMATION-LAB-DC1"
    }
  }
}

## Example 2 - Multiple ACLs from Input Variable ##

module "acls" {
  for_each = var.acls
  source  = "terraform-cisco-modules/freeform/dcnm"
  version = "1.0.0"

  content   = each.value.content
  switches  = each.value.switches
}


## Example 3 - Single ACL read from text file ##

module "file-acl" {
  source  = "terraform-cisco-modules/freeform/dcnm"
  version = "1.0.0"

  content = file("example_acl.txt")
  switches  = {
    DC1-LEAF1 = {
      name = "DC1-LEAF1"
      fabric = "AUTOMATION-LAB-DC1"
    }
    DC1-LEAF2 = {
      name = "DC1-LEAF2"
      fabric = "AUTOMATION-LAB-DC1"
    }
  }
}
