
resource "aws_security_group" "elb" {
  description = "ELB Allowed Ports"
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    }
  ]

  ingress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = ""
      from_port        = 8082
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8082
    }
  ]
  name = "EC2ContainerService-default-AlbSecurityGroup-190OUPV7HHCTP"

  tags   = var.common_tags
  vpc_id = var.vpc_id

  timeouts {}
}
