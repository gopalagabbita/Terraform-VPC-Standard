resource "aws_instance" "Demo-Server" {
  instance_type               = var.instance_type
  key_name                    = var.key_name
  ami                         = data.aws_ami.ubuntu_22_04.id
  vpc_security_group_ids      = [aws_security_group.vpc_standard-sg.id]
  associate_public_ip_address = true
  availability_zone           = var.availability_zone
  subnet_id                   = aws_subnet.standard_subnet_01.id
  count                       = 2

  # Root disk
  root_block_device {
    volume_size           = var.volume_size
    volume_type           = var.volume_type
    encrypted             = true
    delete_on_termination = true
  }

  user_data_base64 = base64encode(file("${path.module}/user_data.sh"))

  tags = {
    "Name" = "Demo-Server"
  }
}
