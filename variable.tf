variable "region" {
  type = string
  description = "Aws region."
}
variable "access_key" {
  type = string
  description = "Aws access key id"
}
variable "secret_key" {
  type = string
  description = "Aws secret key"
}

variable "default_tags" {
  type = map
  description = "default tags"
  default = {
     Environment = "Test"
     Owner       = "TFProviders"
     Project     = "Test"
   }
 }