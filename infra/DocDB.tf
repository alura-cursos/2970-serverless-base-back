resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "docdb-cluster-serverless2"
  master_username         = "alura"
  master_password         = "admin123"
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  apply_immediately       = true
  db_subnet_group_name    = module.vpc.database_subnet_group_name
  vpc_security_group_ids  = [aws_security_group.docdb.id]
}

resource "aws_docdb_cluster_instance" "serverless2_app" {
  identifier         = "docdb-cluster-serverless2-1"
  cluster_identifier = aws_docdb_cluster.docdb.id
  instance_class     = "db.t3.medium"
}
