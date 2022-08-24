# variable "acls" {
#   type = map(object({
#     name = string
#     content = map(string)
#     switches = list(string)
#   }))
# }

variable "content" {
  type = string
}
