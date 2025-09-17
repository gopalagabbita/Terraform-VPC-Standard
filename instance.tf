resource "aws_instance" "Jenkins-Server" {
  instance_type               = var.instance_type
  key_name                    = var.key_name
  ami                         = var.ami
  vpc_security_group_ids      = [aws_security_group.vpc_standard-sg.id]
  associate_public_ip_address = true
  availability_zone           = var.availability_zone
  subnet_id                   = aws_subnet.standard_subnet_01.id
  #root disk
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = false
    delete_on_termination = true
  }
  tags = {
    "Name" = "Jenkins-Server"
  }
}
