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

variable "public_subnet_id_1" {
  description = "The ID of the first public subnet."
}

variable "public_subnet_id_2" {
  description = "The ID of the second public subnet."
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

# Add the key_pair_name variable here if it is missing
variable "key_pair_name" {
  description = "The name of the key pair for SSH access."
}