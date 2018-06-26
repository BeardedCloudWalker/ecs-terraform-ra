## CloudWatch Logs

resource "aws_cloudwatch_log_group" "ecs" {
  name = "${var.cloudwatch_log_group_prefix}/${var.cloudwatch_ecs_container}"
}

#resource "aws_cloudwatch_log_group" "service-a" {
  #name = "${var.cloudwatch_log_group_prefix}/${var.ecs_service_name_a}"
#}

#resource "aws_cloudwatch_log_group" "service-b" {
  #name = "${var.cloudwatch_log_group_prefix}/${var.ecs_service_name_b}"
#}

