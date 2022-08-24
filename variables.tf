### DCNM/NDFC Variables - Provided from TFCB Workspace ###
variable "dcnm_user" {
  type = string
}

variable "dcnm_password" {
  type = string
}

variable "dcnm_url" {
  type = string
}

variable "platform" {
  type = string
}

# variable "acls" {
#   type = map(object({
#     name = string
#     content = map(string)
#     switches = list(string)
#   }))
# }

### ACL Content ###

variable "content" {
  type = string
}
