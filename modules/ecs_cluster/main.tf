resource "aws_ecs_cluster" "main" {
  name = var.cluster_name
}


module "api_task_definition" {
  source = "./modules/task_definitions/api"
  region = var.region


  API_IMAGE = var.API_IMAGE
  taskExecutionRole = var.taskExecutionRole
}

module "api_service" {
  source = "./modules/services/api"
  SECURITY_GROUPS = var.SECURITY_GROUPS
  SUBNET_ID = var.SUBNET_ID
  TARGET_GROUP_ARN = var.TARGET_GROUP_ARN
  CLUSTER_ID = aws_ecs_cluster.main.id
  TASK_DEFINITION = module.api_task_definition.key_cloak_task_definition_arn
}