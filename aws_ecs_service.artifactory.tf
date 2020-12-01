resource "aws_ecs_service" "artifactory" {
  name                               = "artifactory-pro-service"
  deployment_maximum_percent         = 200
  deployment_minimum_healthy_percent = 100
  desired_count                      = 1
  enable_ecs_managed_tags            = true
  health_check_grace_period_seconds  = 0
  cluster                            = var.cluster_arn
  launch_type                        = "EC2"
  scheduling_strategy                = "REPLICA"
  tags                               = var.common_tags
  task_definition                    = "${aws_ecs_task_definition.artifactory.family}:${aws_ecs_task_definition.artifactory.revision}"
  wait_for_steady_state              = false
  iam_role                           = "ecsServiceRole"

  deployment_controller {
    type = "ECS"
  }

  load_balancer {
    container_name = "artifactory"
    container_port = 8081
    elb_name       = aws_elb.artifactory.name
  }

  ordered_placement_strategy {
    field = "attribute:ecs.availability-zone"
    type  = "spread"
  }
  ordered_placement_strategy {
    field = "instanceId"
    type  = "spread"
  }
  timeouts {}

  lifecycle {
    ignore_changes = [tags]
  }
}

data "aws_iam_role" "ecs_service" {
  name = "AWSServiceRoleForECS"
}
