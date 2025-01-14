resource "aws_security_group" "alb_security_group" {
  name = "alb_ecurity_group"
  description = "ALB Security group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow ALB to connect to API"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    # cidr_blocks = [var.subnets_cidr_block_a,var.subnets_cidr_block_b]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

}


resource "aws_security_group" "api_security_group" {
  name = "api_ecurity_group"
  description = "Api Security group"
  vpc_id = var.vpc_id

  ingress {
    description = "Allow EC2 to connect to API"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    # cidr_blocks = [var.subnets_cidr_block_a,var.subnets_cidr_block_b]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Allow all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]
  }

}

