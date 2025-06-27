resource "aws_db_instance" "db" {
  identifier              = "${var.cy_org}-${var.cy_project}-${var.cy_env}-${var.cy_component}"
  apply_immediately       = true
  backup_window           = "02:00-04:00"
  maintenance_window      = "tue:06:00-tue:07:00"
  db_subnet_group_name    = aws_db_subnet_group.rds.name
  engine                  = "mysql"
  engine_version          = "${var.rds_engine_version}"
  instance_class          = "${var.rds_instance_class}"
  multi_az                = false
  parameter_group_name    = aws_db_parameter_group.rds-optimized.name
  allocated_storage       = var.rds_allocated_storage
  skip_final_snapshot     = true
  username                = var.master_username
  password                = random_password.rds.result
  vpc_security_group_ids  = ["${aws_security_group.rds.id}"]
  db_name                 = var.database_name
} 