resource "aws_launch_configuration" "cluster" {
  name                 = "ecs_terraform"
  image_id             = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${var.security_group_id}"]
  key_name             = "${var.keypair_name}"
  iam_instance_profile = "${var.iam_instance_profile}"
  lifecycle {
    create_before_destroy = true
  }
}

data "aws_security_group" "selected" {
  id = "${var.security_group_id}"
}


resource "aws_autoscaling_group" "cluster" {
  name = "${aws_launch_configuration.cluster.name}-asg"
  launch_configuration = "${aws_launch_configuration.cluster.name}"
  vpc_zone_identifier = ["${var.subnets}"]
  min_size = 1
  desired_capacity = 1
  max_size = 2
  health_check_type = "EC2"
  default_cooldown = 300
  wait_for_capacity_timeout = "1m"
  lifecycle {
    create_before_destroy = true
  }
}