
output "api_security_group" {
  description = "ID of the security group created for Keycloak"
  value       = aws_security_group.api_security_group.id
}


output "alb_security_group" {
  description = "ID of the security group created for ALB"
  value       = aws_security_group.alb_security_group.id
}
