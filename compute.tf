resource "aws_key_pair" "devops_key_pair" {
  key_name   = "devops-key-pair"
  public_key = file("${path.module}/keys/key-devops-lpinto.pub")
}

resource "aws_instance" "vms_devops01" {
  ami                    = "ami-067bcf851477ebb78"
  instance_type          = "t3.nano"
  subnet_id              = aws_subnet.devops_public_subnet_1a.id
  vpc_security_group_ids = [aws_security_group.sg_ec2.id]
  key_name               = aws_key_pair.devops_key_pair.key_name

  tags = {
    Name = "vms-devops01"
  }
}