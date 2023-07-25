variable "aws_region" {
  description = "The AWS region where resources will be provisioned."
}

variable "public_ami" {
  description = "The AMI ID for the public EC2 instance."
}

variable "private_ami" {
  description = "The AMI ID for the private EC2 instance."
}

variable "instance_type" {
  description = "The instance type for both EC2 instances."
}

variable "public_subnet_id" {
  description = "The ID of the public subnet where the public EC2 instance will be launched."
}

variable "private_subnet_id" {
  description = "The ID of the private subnet where the private EC2 instance will be launched."
}

variable "num_public_instances" {
  description = "The number of public EC2 instances to create."
}


variable "num_private_instances" {
  description = "The number of private EC2 instances to create."
}

