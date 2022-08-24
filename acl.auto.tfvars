# name = "TF-TEST-ACL"

content = <<EOT
ip access-list TF-TEST-ACL
  10 permit ip any any
  20 permit ip 1.1.1.1/32 2.2.2.2/32
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
