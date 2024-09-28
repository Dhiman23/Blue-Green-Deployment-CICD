resource "aws_security_group" "web-sg-1" {
  dynamic "ingress" {
    for_each = var.ports
     content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "jenkins-server" {
  ami             = var.ami
  instance_type   = var.server
  key_name        = "bgKey"
  security_groups = [aws_security_group.web-sg-1.name]
  user_data       = templatefile("./serversetup.sh",{})

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name = "server"
  }

  associate_public_ip_address = true
}