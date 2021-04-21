variable "name" {
  type        = string
  description = "Name."
}

variable "namespace" {
  type        = string
  description = "Namespace."
}

# variable "data" {
#   type        = map(string)
#   description = "Secret Data."
# }

variable "key" {
  type        = string
  description = "Key."
}

variable "value" {
  type        = string
  description = "Value."
}
