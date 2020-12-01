resource "aws_security_group_rule" "fromelb" {
  description      = "from elb"
  from_port        = 8081
  ipv6_cidr_blocks = []
  prefix_list_ids  = []
  protocol         = "tcp"
  source_security_group_id   = aws_security_group.elb.id
  to_port           = 8082
  security_group_id = var.instance_SG
  type              = "ingress"
}

resource "aws_security_group_rule" "cidr" {
  cidr_blocks       = var.allowed_cidr
  description       = "from internet"
  from_port         = 8081
  ipv6_cidr_blocks  = []
  prefix_list_ids   = []
  protocol          = "tcp"
  self              = false
  to_port           = 8082
  security_group_id = var.instance_SG
  type              = "ingress"
}
