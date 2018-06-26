## CloudWatch Logs

resource "aws_cloudwatch_log_group" "service-a" {
  name = "${var.cloudwatch_log_group_prefix}/${var.ecs_service_name_a}-tf"
}

resource "aws_cloudwatch_log_group" "service-b" {
  name = "${var.cloudwatch_log_group_prefix}/${var.ecs_service_name_b}-tf"
}

