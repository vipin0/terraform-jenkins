variable "region" {
  type = string
  description = "Aws region."
  default = "us-east-1"
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

 variable "instance_ingress_ports" {
   type = list(string)
   description = "ingress port for instance"
   default = [ "80" ]
 }
 variable "associate_public_ip_address" {
  description = "Assign public IP address to instances"
  type        = bool
  default     = true
}
variable "instance_type" {
  description = "Intance type to run"
  type        = string
  default = "t2.micro"
}
variable "key_name" {
  description = "key for the instance to SSH"
  type        = string
}