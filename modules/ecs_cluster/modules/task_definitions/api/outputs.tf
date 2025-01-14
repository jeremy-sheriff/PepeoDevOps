output "key_cloak_task_definition_arn" {
  value = aws_ecs_task_definition.api_task_definition.arn
}


output "aws_ecs_task_definition_revision" {
  value = aws_ecs_task_definition.api_task_definition.revision
}