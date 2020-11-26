resource "aws_ecs_service" "artifactory" {
  name = "artifactory-pro-service"

  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  enable_ecs_managed_tags            = false
  health_check_grace_period_seconds  = 0
  cluster                            = var.cluster_arn

  launch_type           = "EC2"
  scheduling_strategy   = "REPLICA"
  tags                  = var.common_tags
  task_definition       = "${aws_ecs_task_definition.artifactory.family}:${aws_ecs_task_definition.artifactory.revision}"
  wait_for_steady_state = false

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    container_name   = "artifactory-pro"
    container_port   = 8082
    target_group_arn = aws_lb_target_group.artifactory.arn
  }

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.artifactory.id,
    ]
    subnets = var.subnet_ids
  }

  timeouts {}
}

data "aws_iam_role" "ecs_service" {
  name = "AWSServiceRoleForECS"
}
