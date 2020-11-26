
resource "aws_lb" "artifactory" {
  subnets = var.subnet_ids


  name               = "test-lb-tf"
  internal           = false
  load_balancer_type = "network"

  enable_deletion_protection = true

  tags = var.common_tags
}

resource "aws_lb_listener" "a" {
  load_balancer_arn = aws_lb.artifactory.arn
  port              = "80"
  protocol          = "TCP"



  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.artifactory.arn
  }
}
