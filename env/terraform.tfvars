# dev

dev_region = "eu-central-1"
dev_cidr_block = "10.10.0.0/16"
dev_sub_cidr_block = "10.10.70.0/24"
dev_ami_image = "ami-0229b8f55e5178b65"
dev_instance_type = "t2.micro"

# prod

prod_region = "us-east-1"
prod_cidr_block = "10.20.0.0/16"
prod_sub_cidr_block = "10.20.70.0/24"
prod_ami_image = "ami-05ffe3c48a9991133"
prod_instance_type = "t2.micro"
prod_bucket_name = "2025gorbucketfirsttime"
prod_allocated_storage = 10
prod_db_name = "mydb"
prod_engine = "mysql"
prod_engine_version = "8.0"
prod_instance_class = "db.t3.micro"
prod_username = "foo"
prod_password = "foobarbaz"
prod_parameter_group_name = "default.mysql8.0"
prod_skip_final_snapshot = true

# staging

staging_region = "eu-west-1"
staging_cidr_block = "10.30.0.0/16"
staging_sub_cidr_block = "10.30.70.0/24"
staging_ami_image = "ami-0fab1b527ffa9b942"
staging_instance_type = "t2.micro"