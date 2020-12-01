
resource "aws_security_group" "elb" {
  description = "ELB Allowed Ports"
  egress = [
    {
      cidr_blocks      = var.outbound
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
      cidr_blocks      = var.allowed_cidr
      description      = "default artifactory ports"
      from_port        = 8081
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8082
    },
    {
      cidr_blocks      = var.allowed_cidr
      description      = "ssl"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    }
  ]
  name = "Art-ELB"

  tags   = var.common_tags
  vpc_id = var.vpc_id

  timeouts {}
}
