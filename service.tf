resource "aws_ecs_service" "cluster" {
  name = "cluster"
  cluster = "${aws_ecs_cluster.cluster.id}"
  task_definition = "${var.task_definition}"
  desired_count = 1
}