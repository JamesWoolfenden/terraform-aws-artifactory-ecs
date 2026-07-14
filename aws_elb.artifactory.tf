resource "aws_elb" "artifactory" {
  # checkov:skip=CKV_AWS_376: backend (instance_protocol) traffic is plaintext HTTP because Artifactory itself doesn't terminate TLS on 8081/8082; traffic stays within the VPC/security-group boundary between the ELB and instance. Accepted for now — fixing this requires TLS termination on the Artifactory instance, a separate piece of work, not a config-only change here.
  instances = var.instances


  listener {
    instance_port      = 8081
    instance_protocol  = "http"
    lb_port            = 8081
    lb_protocol        = "https"
    ssl_certificate_id = var.ssl_certificate_id
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

  access_logs {
    bucket   = aws_s3_bucket.elb_logs.id
    enabled  = true
    interval = 60
  }

  depends_on = [aws_s3_bucket_policy.elb_logs]
}
