## ALB

# Create ALB
resource "aws_alb" "ecs-alb" {
  name            = "${var.alb_name}"
  subnets         = ["${var.public_subnet_az1}","${var.public_subnet_az2}"]
  security_groups = ["${var.security_group_alb}"]
  internal        = false

  lifecycle { create_before_destroy = true }
}

# Add Target group for service-a
resource "aws_alb_target_group" "service_a_target_group" {
  name     = "${var.ecs_service_name_a}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    matcher             = "200-299"
    path                = "/"
  }
  lifecycle { create_before_destroy = true }
}

# Add Target group for service-b
resource "aws_alb_target_group" "service_b_target_group" {
  name     = "${var.ecs_service_name_b}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 10
    matcher             = "200-299"
    path                = "/"
  }
  lifecycle { create_before_destroy = true }
}

resource "aws_alb_target_group" "initial" {
  name     = "tf-initial-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.vpc_id}"
}

# Listener
resource "aws_alb_listener" "front_end" {
  load_balancer_arn = "${aws_alb.ecs-alb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_alb_target_group.initial.arn}"
    type             = "forward"
  }
}

## Add Listener Rule for service-a
resource "aws_alb_listener_rule" "service-a" {
  listener_arn = "${aws_alb_listener.front_end.arn}"
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.service_a_target_group.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/alpha"]
  }
}
## Add Listener Rule for service-b
resource "aws_alb_listener_rule" "service-b" {
  listener_arn = "${aws_alb_listener.front_end.arn}"
  priority     = 2

  action {
    type             = "forward"
    target_group_arn = "${aws_alb_target_group.service_b_target_group.arn}"
  }

  condition {
    field  = "path-pattern"
    values = ["/beta"]
  }
}

