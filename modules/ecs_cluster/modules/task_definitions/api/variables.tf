# variable "cluster_name" {
#   description = "Name of the ECS cluster"
#   type        = string
# }

variable "taskExecutionRole" {
  description = "ecsTaskExecutionRole"
  # default     = "arn:aws:iam::975049979529:role/ecsTaskExecutionRole"
}


variable "region" {
  description = "Aws Region"
  type = string
}

variable "API_IMAGE" {
  description = "API_IMAGE"
  type = string
}

