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
  public_subnet_id_1   = "10.0.0.0/24"  # Replace with the actual first public subnet ID
  public_subnet_id_2   = "10.0.1.0/24"  # Replace with the actual second public subnet ID
}

module "ec2_instances" {
  source            = "./modules/ec2_instances"
  aws_region        = var.aws_region
  public_ami        = "ami-069c45f40acdfe41e"  # Replace with the AMI ID for the public EC2 instance
  private_ami       = "ami-069c45f40acdfe41e"  # Replace with the AMI ID for the private EC2 instance
  instance_type     = var.instance_type  # Replace with your desired instance type
  public_subnet_id_1 = module.networking.public_subnets_id_1  # Access the first public subnet ID
  public_subnet_id_2 = module.networking.public_subnets_id_2  # Access the second public subnet ID
  private_subnet_id = module.networking.private_subnets_id_1
  num_public_instances  = 2
  num_private_instances = 3
  key_pair_name         = "terraformec2" # Enter the .pem key
}

module "alb" {
  source                   = "./modules/alb"
  vpc_id                   = "${module.networking.vpc_id}"
  public_instance_id_1     = "${module.ec2_instances.public_instance_id_1}"
  public_instance_id_2     = "${module.ec2_instances.public_instance_id_2}"
  public_subnets_id_1      = "${module.networking.public_subnets_id_1}"
  public_subnets_id_2      = "${module.networking.public_subnets_id_2}"
}

module "rds" {
  source      = "./modules/rds"
  db_instance = "db.t2.micro"
  rds_subnet1 = "${module.networking.private_subnets_id_1}"
  rds_subnet2 = "${module.networking.private_subnets_id_2}"
  vpc_id      = "${module.networking.vpc_id}"
}
