resource "aws_elb" "artifactory" {
  #checkov:skip= CKV_AWS_92: "Ensure the ELB has access logging enabled"
  instances = var.instances


  listener {
    instance_port     = 8081
    instance_protocol = "http"
    lb_port           = 8081
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8082
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = var.ssl_certificate_id
  }

  health_check {
    healthy_threshold   = 10
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:8081/"
    interval            = 30
  }


  cross_zone_load_balancing   = true
  idle_timeout                = 60
  connection_draining         = true
  connection_draining_timeout = 300

  internal = false

  name            = "JFrog-Artifactory-Pro-ECS-ELB"
  security_groups = [aws_security_group.elb.id]
  subnets         = var.subnet_ids
  tags            = {}

}
