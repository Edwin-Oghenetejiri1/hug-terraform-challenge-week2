variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "my_ip" {
  description = "Your IP address for SSH and custom port access"
  type        = list(string)
}

variable "env_prefix" {
  description = "Environment prefix for naming resources"
  type        = string
}