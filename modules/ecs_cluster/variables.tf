variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "API_IMAGE" {
  description = "API_IMAGE"
  type        = string
}


variable "taskExecutionRole" {
  description = "ecsTaskExecutionRole"
  # default     = "arn:aws:iam::975049979529:role/ecsTaskExecutionRole"
}


variable "region" {
  description = "Aws Region"
  type = string
}


variable "SECURITY_GROUPS" {
  description = "Security groups"
  type = any
}


variable "SUBNET_ID" {
  description = "SUBNET_ID"
  type = any
}


variable "TARGET_GROUP_ARN" {
  description = "TARGET_GROUP_ARN"
  type = any
}


variable "CLUSTER_ID" {
  description = "CLUSTER_ID"
  type = any
}

