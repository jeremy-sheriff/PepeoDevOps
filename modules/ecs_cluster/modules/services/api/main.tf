resource "aws_ecs_service" "api_service" {
  name            = "api-service"
  cluster         = var.CLUSTER_ID  # Correct reference
  task_definition = var.TASK_DEFINITION
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.SUBNET_ID  # Correct reference
    security_groups = var.SECURITY_GROUPS
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn =  var.TARGET_GROUP_ARN
    container_name   = "api-container"
    container_port   = 8080
  }
}