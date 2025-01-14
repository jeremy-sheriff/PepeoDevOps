variable "name" {
  description = "The name of the load balancer"
  type        = string
}

variable "load_balancer_type" {
  description = "The type of the load balancer"
  type        = string
}

variable "internal" {
  description = "Whether the load balancer is internal or internet-facing"
  type        = bool
  default     = false
}

variable "security_groups" {
  description = "List of security group IDs to associate with the ALB"
  type        = list(string)
}

variable "subnets" {
  description = "List of subnet IDs to launch the ALB in"
  type        = list(string)
}

# variable "certificate_arn" {
#   description = "The ARN of the ACM certificate"
#   type        = string
# }


variable "api_target_group_arn" {
  description = "The ARN of the target group to forward requests to"
  type        = string
}


variable "ssl_policy" {
  description = "The SSL policy to use for HTTPS"
  type        = string
  default     = "ELBSecurityPolicy-2016-08"
}

variable "enable_deletion_protection" {
  description = "Whether to enable deletion protection for the ALB"
  type        = bool
  default     = false
}

variable "idle_timeout" {
  description = "Idle timeout in seconds for the ALB"
  type        = number
  default     = 60
}
