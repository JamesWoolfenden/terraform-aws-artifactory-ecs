resource "aws_lb_target_group" "artifactory" {
  deregistration_delay = 300

  lambda_multi_value_headers_enabled = false
  load_balancing_algorithm_type      = "round_robin"
  name                               = "EC2Co-Defau-1P1XQ03D42A3J"
  port                               = 8082
  protocol                           = "TCP"
  proxy_protocol_v2                  = false
  slow_start                         = 0
  tags                               = var.common_tags
  target_type                        = "ip"
  vpc_id                             = var.vpc_id

  health_check {
    enabled           = true
    healthy_threshold = 5
    interval          = 30

    port                = "traffic-port"
    protocol            = "TCP"
    unhealthy_threshold = 5
  }
}


//needs auto scaling group and other resources to make hosts
