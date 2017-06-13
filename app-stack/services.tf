# Create ECS service-a
resource "aws_ecs_service" "service-a" {
  name            = "${var.ecs_service_name_a}"
  cluster         = "${data.terraform_remote_state.global.ecs_cluster_name}"
  task_definition = "${aws_ecs_task_definition.service-a.arn}"
  desired_count   = 3
  iam_role        = "${data.terraform_remote_state.global.ecs_container_iam_role}"

  load_balancer {
    target_group_arn = "${data.terraform_remote_state.global.service_a_target_group}"
    container_name   = "${var.ecs_service_name_a}"
    container_port   = "${var.ecs_service_docker_port_a}"
  }
}

# Create ECS service-b
resource "aws_ecs_service" "service-b" {
  name            = "${var.ecs_service_name_b}"
  cluster         = "${data.terraform_remote_state.global.ecs_cluster_name}"
  task_definition = "${aws_ecs_task_definition.service-b.arn}"
  desired_count   = 3
  iam_role        = "${data.terraform_remote_state.global.ecs_container_iam_role}"

  load_balancer {
    target_group_arn = "${data.terraform_remote_state.global.service_b_target_group}"
    container_name   = "${var.ecs_service_name_b}"
    container_port   = "${var.ecs_service_docker_port_b}"
  }

}
