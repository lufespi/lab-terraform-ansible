resource "aws_security_group" "sg_ec2" {
  name        = "sg_ec2"
  description = "Permite trafego SSH (porta 22)"
  vpc_id      = aws_vpc.devops_vpc.id

  tags = {
    Name = "sg-ec2"
  }
}

resource "aws_vpc_security_group_ingress_rule" "sg_ec2_allow_ssh" {
  security_group_id = aws_security_group.sg_ec2.id
  description       = "Trafego SSH publico"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "sg_ec2_allow_http" {
  security_group_id = aws_security_group.sg_ec2.id
  description       = "Trafego HTTP publico"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "sg_ec2_allow_http_outbound" {
  security_group_id = aws_security_group.sg_ec2.id
  description       = "Permite HTTP de saida para repositorios apt"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "sg_ec2_allow_https_outbound" {
  security_group_id = aws_security_group.sg_ec2.id
  description       = "Permite HTTPS de saida para repositorios apt"
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  to_port           = 443
  ip_protocol       = "tcp"
}