variable "vpc_id" {
  description = "Vpc Id"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "subnets_cidr_block_a" {
  description = "Description of the subnets allowed"
  type        = string
}

variable "subnets_cidr_block_b" {
  description = "Description of the subnets allowed"
  type        = string
}
