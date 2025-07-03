module "dev" {
    source = "./dev"
    dev_region = var.dev_region
    dev_cidr_block = var.dev_cidr_block
    dev_sub_cidr_block = var.dev_sub_cidr_block
    dev_ami_image = var.dev_ami_image
    dev_instance_type = var.dev_instance_type
}

module "prod" {
    source = "./prod"
    prod_region = var.prod_region
    prod_cidr_block = var.prod_cidr_block
    prod_sub_cidr_block = var.prod_sub_cidr_block
    prod_ami_image = var.prod_ami_image
    prod_instance_type = var.prod_instance_type
    prod_bucket_name = var.prod_bucket_name
    prod_allocated_storage = var.prod_allocated_storage
    prod_db_name = var.prod_db_name
    prod_engine = var.prod_engine
    prod_engine_version = var.prod_engine_version
    prod_instance_class = var.prod_instance_class
    prod_username = var.prod_username
    prod_password = var.prod_password
    prod_parameter_group_name = var.prod_parameter_group_name
    prod_skip_final_snapshot = var.prod_skip_final_snapshot
}

module "staging" {
    source = "./staging"
    staging_region = var.staging_region
    staging_cidr_block = var.staging_cidr_block
    staging_sub_cidr_block = var.staging_sub_cidr_block
    staging_ami_image = var.staging_ami_image
    staging_instance_type = var.staging_instance_type
}
