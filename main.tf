provider "aws" {
  region = var.region
}

module "networking" {
  source = "./modules/networking"

  project              = var.project
  environment          = var.environment
  region               = var.region
  availability_zones   = var.availability_zones
  vpc_cidr             = var.vpc_cidr
  public_subnets_cidr  = var.public_subnets_cidr
  private_subnets_cidr = var.private_subnets_cidr
}

module "ec2_instances" {
  source            = "./modules/ec2_instances"
  aws_region        = var.aws_region
  public_ami        = "ami-069c45f40acdfe41e"  # Replace with the AMI ID for the public EC2 instance
  private_ami       = "ami-069c45f40acdfe41e"  # Replace with the AMI ID for the private EC2 instance
  instance_type     = var.instance_type  # Replace with your desired instance type
  public_subnet_id  = module.networking.public_subnets_id[0]
  private_subnet_id = module.networking.private_subnets_id[0]
  num_public_instances  = 1
  num_private_instances = 2
  
}