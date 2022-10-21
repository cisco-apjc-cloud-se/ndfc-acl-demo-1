### Multiple ACL Input Variable ###

acls = {
  test-acl-1 = {
    content = <<-EOT
    ip access-list TF-MULTI-ACL-1
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
  test-acl-2 = {
    content = <<-EOT
    ip access-list TF-MULTI-ACL-2
      10 permit ip any any
      20 permit ip 3.3.3.3/32 4.4.4.4/32
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
      DC1-LEAF1 = {
        name = "DC2-VBGW1"
        fabric = "AUTOMATION-LAB-DC2"
      }
      DC1-LEAF2 = {
        name = "DC2-VBGW2"
        fabric = "AUTOMATION-LAB-DC2"
      }
    }
  }
}
