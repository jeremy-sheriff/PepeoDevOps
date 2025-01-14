variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "cidr_block_a" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "cidr_block_b" {
  description = "Subnet CIDR block for the subnet"
  type        = string
}

variable "availability_zone_a" {
  description = "Availability zone for the subnet"
  type        = string
}

variable "availability_zone_b" {
  description = "Availability zone for the subnet B"
  type        = string
}
