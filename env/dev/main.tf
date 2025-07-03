provider "aws" {
  region = var.dev_region
}

module "vpc" {
  source = "../../modules/vpc"
  vpc_cidr_block = var.dev_cidr_block
}

module "subnet" {
  source = "../../modules/subnet"
  subnet_cidr_block = var.dev_sub_cidr_block
  vpc_id = module.vpc.vpc_id_for_use
}

module "ec2" {
  source = "../../modules/ec2"
  ami = var.dev_ami_image
  instance_type = var.dev_instance_type
  subnet_id = module.subnet.subnet_id
  depends_on = [module.subnet]
}