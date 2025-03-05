resource "aws_security_group" "ec2" {
  name        = "${var.cy_org}-${var.cy_pro}-${var.cy_env}-${var.cy_com}"
  vpc_id      = data.aws_subnet.selected.vpc_id
}

resource "aws_security_group_rule" "egress-all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ec2.id
}

resource "aws_security_group_rule" "demo_ingress" {
    for_each          = var.vm_ports_in

    type              = "ingress"
    description       = "Allow ${each.value}/TCP from internet"
    security_group_id = aws_security_group.ec2.id
    cidr_blocks       = ["0.0.0.0/0"]
    protocol          = "tcp"
    from_port         = each.value
    to_port           = each.value
}

resource "aws_instance" "ec2" {
  ami           = data.aws_ami.debian.id
  instance_type = var.vm_instance_type
  key_name      = aws_key_pair.key_pair.key_name

  vpc_security_group_ids = [aws_security_group.ec2.id]

  subnet_id               = data.aws_subnet.selected.id
  disable_api_termination = false

  root_block_device {
    volume_size           = var.vm_disk_size
    delete_on_termination = true
  }

  lifecycle {
    ignore_changes = [ami]
  }
}