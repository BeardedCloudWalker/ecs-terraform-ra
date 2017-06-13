### ECS Launch Configuration

data "template_file" "user_data_script" {
  template = "${file("${path.module}/user-data-script.sh")}"

  vars {
    ecs_cluster_name   = "${aws_ecs_cluster.ecs-cluster.name}"
  }
}

resource "aws_launch_configuration" "ecs-cluster" {
  security_groups = ["${var.security_group_ecs}"]

  name                        = "${var.ecs_launch_config_name}"
  key_name                    = "${var.key_name}"
  image_id                    = "${var.image_id}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${aws_iam_instance_profile.ecs-container-instance.name}"
  user_data = "${data.template_file.user_data_script.rendered}"
  associate_public_ip_address = false
  lifecycle { create_before_destroy = true }
}
