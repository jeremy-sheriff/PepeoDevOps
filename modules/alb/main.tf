terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.54.1"
    }
  }
}
resource "aws_lb" "app_load_balancer" {
  name               = var.name
  internal           = var.internal
  load_balancer_type = var.load_balancer_type
  security_groups    = var.security_groups
  subnets            = var.subnets

  enable_deletion_protection = var.enable_deletion_protection
  idle_timeout               = var.idle_timeout
}

# resource "aws_lb_listener" "https" {
#   load_balancer_arn = aws_lb.app_load_balancer.arn
#   port              = 443
#   protocol          = "HTTPS"
#   # ssl_policy        = var.ssl_policy
#   # certificate_arn   = var.certificate_arn
#
#
# }

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"
    redirect {
      protocol    = "HTTPS"
      port        = "443"
      status_code = "HTTP_301"
    }
  }

}

resource "aws_lb_listener_rule" "api" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 200

  action {
    type             = "forward"
    target_group_arn = var.api_target_group_arn
  }

  condition {
    path_pattern {
      values = ["/api/*"]
    }
  }
}

