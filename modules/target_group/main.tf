resource "aws_lb_target_group" "api" {
  name        = "api-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = var.target_type

  # health_check {
  #   path                = "/keycloak/auth/health"
  #   port                = 9000  # Health check on port 9000
  #   interval            = 60
  #   timeout             = 10
  #   healthy_threshold   = 10
  #   unhealthy_threshold = 10
  #   matcher             = "200-299"
  # }
}



