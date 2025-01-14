output "alb_arn" {
  description = "The ARN of the ALB"
  value       = aws_lb.app_load_balancer.arn
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.app_load_balancer.dns_name
}

output "alb_zone_id" {
  description = "The zone ID of the ALB"
  value       = aws_lb.app_load_balancer.zone_id
}
