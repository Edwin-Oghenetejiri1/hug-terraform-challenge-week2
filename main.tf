terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket         = "hug-terraform-state-573986291693"
    key            = "week2/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "hug-terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr_block = var.vpc_cidr_block
  env_prefix     = var.env_prefix
}

module "networking" {
  source            = "./modules/networking"
  vpc_id            = module.vpc.vpc_id
  subnet_cidr_block = var.subnet_cidr_block
  availability_zone = var.availability_zone
  env_prefix        = var.env_prefix
}

module "security_group" {
  source     = "./modules/security-group"
  vpc_id     = module.vpc.vpc_id
  my_ip      = var.my_ip
  env_prefix = var.env_prefix
}

module "compute" {
  source            = "./modules/compute"
  instance_type     = var.instance_type
  subnet_id         = module.networking.subnet_id
  security_group_id = module.security_group.security_group_id
  availability_zone = var.availability_zone
  key_name          = var.key_name
  public_key_path   = var.public_key_path
  env_prefix        = var.env_prefix
}