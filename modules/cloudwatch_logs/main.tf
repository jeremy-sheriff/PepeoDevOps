resource "aws_cloudwatch_log_group" "ui" {
  name              = var.logName
  retention_in_days = 7
}
