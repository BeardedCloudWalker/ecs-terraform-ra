# Create ASG for ECS service-a
resource "aws_autoscaling_group" "service-a" {

  # spread the app instances across the availability zones
  # availability_zones = ["${split(",", var.availability_zones)}"]

  name                  = "${var.ecs_service_name_a}"
  vpc_zone_identifier   = ["${var.private_subnet_az1}","${var.private_subnet_az2}"]
  min_size              = "${var.asg_min}"
  max_size              = "${var.asg_max}"
  desired_capacity      = "${var.asg_desired}"
  min_elb_capacity      = "${var.elb_capacity}"
  launch_configuration  = "${aws_launch_configuration.ecs-cluster.name}"
  #target_group_arns     = ["${aws_alb_target_group.service-a.arn}","${aws_alb_target_group.service-b.arn}"]
  health_check_grace_period = 0
  lifecycle { create_before_destroy = true }
}
