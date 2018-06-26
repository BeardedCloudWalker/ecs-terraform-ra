output "ecs_alb_dns" {
  value = "${aws_alb.ecs-alb.dns_name}"
}

output "ecs_cluster_name" {
  value = "${aws_ecs_cluster.ecs-cluster.id}"
}

output "initial_target_group" {
  value = "${aws_alb_target_group.initial.arn}"
}

output "service_a_target_group" {
  value = "${aws_alb_target_group.service_a_target_group.arn}"
}

output "service_b_target_group" {
  value = "${aws_alb_target_group.service_b_target_group.arn}"
}

output "ecs_container_iam_role" {
  value = "${aws_iam_role.ecs-container-instance.arn}"
}
