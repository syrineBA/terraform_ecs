
# main creds for AWS connection
variable "aws_access_key_id" {
  description = "AWS access key"
}
variable "aws_secret_access_key" {
  description = "AWS secret access key"
}
variable "keypair_name" {
  description = "AWS keypair name"
}
variable "ecs_key_pair_name" {
  description = "EC2 instance key pair name"
}
variable "security_group_id" {
  description = "AWS security group id "
}
variable "subnets" {
  description = "subnets to use "
}
# Basic informations
variable "ami_id" {
  description = "ami id to use to launch the instance ( ami created by packer ) "
}
variable "ecs_cluster" {
  description = "ECS cluster name"
}
variable "instance_type" {
  description = "the instance type to choose"

}
variable "iam_instance_profile" {
  description = "the instance profile to choose wich contain information about the IAM Role "
}
variable "task_definition" {
  description = "the task definition wich contain the project to run "

}

variable "autoscaling_group" {
  description = "EC2 autoscaling group"
}

//variable "test_public_sg" {
//  description = "EC2 instance security group name"
//}

variable "region" {
  description = "AWS region"
}

variable "availability_zone" {
  description = "availability zone used for the demo, based on region"
  default = {
    us-east-1 = "us-east-1"
  }
}

########################### Test VPC Config ################################

variable "test_vpc" {
  description = "VPC name for Test environment"
}

variable "test_network_cidr" {
  description = "IP addressing for Test Network"
}

variable "test_public_01_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

variable "test_public_02_cidr" {
  description = "Public 0.0 CIDR for externally accessible subnet"
}

########################### Autoscale Config ################################

variable "max_instance_size" {
  description = "Maximum number of instances in the cluster"
}

variable "min_instance_size" {
  description = "Minimum number of instances in the cluster"
}

variable "desired_capacity" {
  description = "Desired number of instances in the cluster"
}