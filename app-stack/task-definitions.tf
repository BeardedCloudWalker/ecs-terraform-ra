### ECS Task Definitions

# Define Task Definition for service-a
data "template_file" "task_definition_service_a" {
  template = "${file("${path.module}/task-definition-service-a.json")}"

  vars {
    name             = "${var.ecs_service_name_a}"
    image            = "${var.ecs_service_docker_image_a}"
    log_group_region = "${var.aws_region}"
    log_group_name   = "${aws_cloudwatch_log_group.service-a.name}"
  }
}

# Define Task Definition for service-b
data "template_file" "task_definition_service_b" {
  template = "${file("${path.module}/task-definition-service-b.json")}"

  vars {
    name             = "${var.ecs_service_name_b}"
    image            = "${var.ecs_service_docker_image_b}"
    log_group_region = "${var.aws_region}"
    log_group_name   = "${aws_cloudwatch_log_group.service-b.name}"
    env_name = "PRODUCT_SERVICE_URL"
    #env_val = "${aws_alb.ecs-alb_dns.dns_name}/beta"
    env_val = "${data.terraform_remote_state.global.ecs_alb_dns}/beta"
  }
}

# Create Task Definition for service-a
resource "aws_ecs_task_definition" "service-a" {
  family                = "${var.ecs_service_name_a}"
  container_definitions = "${data.template_file.task_definition_service_a.rendered}"
}

# Create Task Definition for service-b
resource "aws_ecs_task_definition" "service-b" {
  family                = "${var.ecs_service_name_b}"
  container_definitions = "${data.template_file.task_definition_service_b.rendered}"
  depends_on = [  "aws_ecs_task_definition.service-a" ]
}

