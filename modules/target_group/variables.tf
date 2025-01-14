variable "name" {
  description = "The name of the target group"
  type        = string
}

variable "port" {
  description = "The port to use for the target group"
  type        = number
}

variable "protocol" {
  description = "The protocol used by the target group"
  type        = string
  default     = "HTTP"
}

variable "vpc_id" {
  description = "The VPC ID to associate the target group with"
  type        = string
}

variable "target_type" {
  default = "ip"
  type = string
}
