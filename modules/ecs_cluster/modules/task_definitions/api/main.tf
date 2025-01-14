resource "aws_ecs_task_definition" "api_task_definition" {
  family                   = "api"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "1024"
  memory                   = "2048"


  container_definitions = jsonencode([
    {
      name      = "api-container"
      image     = var.API_IMAGE # Custom image with the realm JSON
      essential = true
      environment = [
        {
          name  = "name"
          value = "value"
        },
      ],
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = "ecs/api"
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "api"
        }
      },
      portMappings = [
        {
          containerPort = 8080,
          hostPort      = 8080,
          protocol      = "tcp"
        }
      ],
      # Removed the command field to avoid conflict with Dockerfile's ENTRYPOINT
      healthCheck = {
        command     = ["CMD-SHELL", "bash -c 'echo -e \"GET /health HTTP/1.1\\r\\nHost: localhost\\r\\n\\r\\n\" | nc -w 10 localhost 80 || exit 1'"]
        interval    = 30
        timeout     = 10
        retries     = 10
        startPeriod = 30
      }

    }
  ])
  execution_role_arn = var.taskExecutionRole
}