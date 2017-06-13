### ECS Variables

variable "alb_name" {
  description = "Name of ALB"
  default     = "dev-ecs-cluster"
}

variable "ecs_cluster_name" {
  description = "Name of ECS cluster"
  default     = "dev-ecs-cluster"
}

## ECS Service A
variable "ecs_service_name_a" {
  description = "Name of first ECS service"
  default     = "dev-website-service-a"
}

variable "ecs_service_docker_image_a" {
  description = "location of docker image for ECS service a"
  default     = "nginx:latest"
}

variable "ecs_service_docker_port_a" {
  description = "container port for ECS service a"
  default     = 80
}

## ECS Service B
variable "ecs_service_name_b" {
  description = "Name of second ECS service"
  default     = "dev-website-service-b"
}

variable "ecs_service_docker_image_b" {
  description = "location of docker image for ECS service b"
  default     = "nginx:latest"
}

variable "ecs_service_docker_port_b" {
  description = "container port for ECS service b"
  default     = 80
}

## Launch Config
variable "ecs_launch_config_name" {
  description = "Name of ECS cluster"
  default     = "dev-ecs-cluster"
}

variable "key_name" {
  description = "Name of AWS key pair"
  default     = "<KEY NAME HERE>"
}

variable "image_id" {
  description = "Id of AMI to use for ECS launch configuration"
  default = "ami-b2df2ca4"
}

variable "instance_type" {
  description = "AWS instance type"
  default     = "t2.large"
}

## AutoScaling
variable "asg_min" {
  description = "Min numbers of servers in ASG"
  default     = "2"
}

variable "asg_max" {
  description = "Max numbers of servers in ASG"
  default     = "6"
}

variable "asg_desired" {
  description = "Desired numbers of servers in ASG"
  default     = "4"
}

variable "elb_capacity" {
  description = "wait for exactly this number of healthy instances in ALB on both create and update operations"
  default     = "1"
}


### Infrastructure Variables

variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "Id of existing VPC"
  default = "vpc-12345678"
}

variable "private_subnet_az1" {
  description = "Id of existing private subnet in AZ1"
  default = "subnet-12345678"
}

variable "private_subnet_az2" {
  description = "Id of existing private subnet in AZ2"
  default = "subnet-12345678"
}

variable "public_subnet_az1" {
  description = "Id of existing public subnet in AZ1"
  default = "subnet-12345678"
}

variable "public_subnet_az2" {
  description = "Id of existing public subnet in AZ2"
  default = "subnet-12345678"
}

variable "security_group_alb" {
  description = "Id of existing security group for the ALB"
  default = "sg-af4ef3d1"
}

variable "security_group_ecs" {
  description = "Id of existing security group for the ECS cluster"
  default = "sg-e14ff29f"
}

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "admin_cidr_ingress" {
  description = "CIDR to allow tcp/22 ingress to EC2 instance"
  default="0.0.0.0/0"
}

## IAM variables

variable "ecs_container_instance" {
  description = "role to assign each EC2 instance"
  default     = "dev-ecs-container-instance"
}

variable "ecs_container_servicetask" {
  description = "role to assign each ECS service"
  default     = "dev-ecs-container-servicetask"
}

variable "ecs_container_service_scheduler" {
  description = "role to assign each ECS service scheduler"
  default     = "dev-ecs-service-scheduler"
}

## Cloudwatch variables
variable "cloudwatch_log_group_prefix" {
  default = "tf-ecs-group/Apps"
}

variable "cloudwatch_ecs_container" {
  default = "ecs-agent"
}

