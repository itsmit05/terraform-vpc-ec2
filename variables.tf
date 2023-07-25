variable "project" {
  description = "The name of the project"
}

variable "environment" {
  description = "The deployment environment"
  default     = "production"
}

variable "region" {
  description = "The AWS Region"
}

variable "availability_zones" {
  type        = list(any)
  description = "The names of the availability zones to use"
}

variable "vpc_cidr" {
  description = "The CIDR block of the vpc"
}

variable "public_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list(any)
  description = "The CIDR block for the private subnet"
}

variable "aws_region" {
  description = "The AWS region where resources will be provisioned."
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