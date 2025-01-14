output "api_target_group_arn" {
  description = "The name of the target group"
  value       = aws_lb_target_group.api.arn
}
