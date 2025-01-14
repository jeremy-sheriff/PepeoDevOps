variable "region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "availability_zone_a" {
  description = "AWS region"
  default     = "us-east-1a"
}

variable "availability_zone_b" {
  description = "AWS region"
  default     = "us-east-1b"
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_a_cidr_block" {
  description = "CIDR block for subnet A"
  default     = "10.0.1.0/24"
}

variable "subnet_b_cidr_block" {
  description = "CIDR block for subnet B"
  default     = "10.0.3.0/24"
}



variable "load_balancer_type" {
  description = "The type of load balancer"
  type        = string
  default = "application"
}



