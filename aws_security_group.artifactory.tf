resource "aws_security_group" "artifactory" {
  egress = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = ""
      from_port   = 0
      ipv6_cidr_blocks = [
        "::/0",
      ]
      prefix_list_ids = []
      protocol        = "-1"
      security_groups = []
      self            = false
      to_port         = 0
    }
  ]

  ingress = [
    {
      cidr_blocks      = var.allowed_cidr
      description      = ""
      from_port        = 8082
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8082
    },
    {
      cidr_blocks      = var.ssh_cidr
      description      = ""
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = [aws_security_group.elb.id]
      self             = false
      to_port          = 22
    },
  ]
  name        = "EC2ContainerService-default-EcsSecurityGroup-1G0YDA91NEKPH"
  description = "ECS Allowed Ports"
  tags        = var.common_tags
  vpc_id      = var.vpc_id

  timeouts {}
}
