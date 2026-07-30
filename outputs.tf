output "vpc_id" {
  description = "ID of the VPC"
  value       = module.vpc.vpc_id
}

output "subnet_id" {
  description = "ID of the public subnet"
  value       = module.networking.subnet_id
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.compute.instance_id
}

output "instance_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = module.compute.instance_public_ip
}

output "instance_public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = module.compute.instance_public_dns
}

output "website_url" {
  description = "URL to access the web server"
  value       = "http://${module.compute.instance_public_ip}"
}

output "ssh_command" {
  description = "Command to SSH into the instance"
  value       = "ssh -i ~/.ssh/id_ed25519 ec2-user@${module.compute.instance_public_ip}"
}