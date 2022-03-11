# -------------------------------------------------------------#
#                     Security groups                          #
# -------------------------------------------------------------#
resource "aws_security_group" "instance_sg" {
  name   = "webserver-sg-group"
  # adding inbound rule for the given ports
  dynamic "ingress" {
    for_each = var.instance_ingress_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  # adding ssh inbound rule
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # outbound rules
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "webserver-sg-01"
  }
}

resource "aws_instance" "app_server" {
  ami                         = data.aws_ami.latest_amazon_linux_ami.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [aws_security_group.instance_sg.id]
  associate_public_ip_address = var.associate_public_ip_address
  
  user_data = "${file("user-data.sh")}"

  tags = {
    Name = "webserver"
  }
}