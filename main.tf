resource "aws_instance" "main" {
  ami               = var.ami_id
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
  key_name          = var.key_name
  tags              = merge({ "Name" : var.name }, var.ec2_tags)
  subnet_id         = var.subnet_id
  vpc_security_group_ids   = [aws_security_group.main.id]
}

resource "aws_security_group" "main" {

  name        = var.sg_name
  description = var.sg_description
  vpc_id      = var.sg_vpc_id

  tags = merge({ "Name" : var.sg_name }, var.sg_tags)
  dynamic "ingress" {
    for_each = var.sg_inbound_ports
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      description = ingress.value.description
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}