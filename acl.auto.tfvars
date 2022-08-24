# name = "TF-TEST-ACL"

content = <<EOT
ip access-list TF-TEST-ACL
  10 permit ip any any
EOT

# switches = {
#   DC1-LEAF-1 = {
#     name = "DC1-LEAF-1"
#     fabric = "CML2-DC1"
#   }
#   DC1-LEAF-2 = {
#     name = "DC1-LEAF-2"
#     fabric = "CML2-DC1"
#   }
# }
