provider "aws" {
  region = var.region
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.4.0"
  

  name = var.vpc_name
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
output "public_subnet_ids" {
  value = module.vpc.public_subnets
}
