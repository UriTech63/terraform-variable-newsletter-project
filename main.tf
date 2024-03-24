


resource "aws_instance" "variable-server" {
  ami                    = var.instance-ami
  instance_type          = var.instancetype
  key_name               = var.keypair
  subnet_id              = aws_subnet.variable-aws_subnet.id
  vpc_security_group_ids = [aws_security_group.variable-sg.id]
  availability_zone      = var.avzone


  tags = {
    Name = "variable-test-instance"
  }
}



