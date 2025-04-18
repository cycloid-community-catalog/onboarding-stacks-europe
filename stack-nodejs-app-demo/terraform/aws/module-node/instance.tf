resource "aws_security_group" "ec2" {
  name        = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  description = "Allow accessing the instance from the internet."
  vpc_id      = data.aws_vpc.selected.id
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_security_group_rule" "ingress-ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_security_group_rule" "ingress-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_instance" "ec2" {
  for_each = data.aws_subnet.selected

  ami           = data.aws_ami.debian.id
  instance_type = var.vm_instance_type
  key_name      = aws_key_pair.key_pair.key_name

  vpc_security_group_ids = [aws_security_group.ec2.id]

  subnet_id               = data.aws_subnet.selected[each.key].id
  disable_api_termination = false

  root_block_device {
    volume_size           = var.vm_disk_size
    delete_on_termination = true
  }

  user_data_base64 = base64encode(templatefile(
    "${path.module}/userdata.sh",
    {
      git_app_url = var.git_app_url
    }
  ))

  tags = {
    Name = "${var.cy_org}-${var.cy_project}-${var.cy_env}"
  }

  lifecycle {
    ignore_changes = [ami]
  }
}

# This is a trick to get the updated public IP address even after a change
data "aws_instance" "ec2" {
  for_each = aws_instance.ec2

  instance_id = aws_instance.ec2[each.key].id
}