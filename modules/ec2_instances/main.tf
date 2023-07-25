provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "public_instance" {
  ami           = var.public_ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_id
  count = var.num_public_instances
  # Other configuration for the public instance, if needed
}

resource "aws_instance" "private_instance" {
  ami           = var.private_ami
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id
  count = var.num_private_instances
  # Other configuration for the private instance, if needed
}

