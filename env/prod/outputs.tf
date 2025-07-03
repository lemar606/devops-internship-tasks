# output "prod_outputs" {
#   value = {
#     vpc_cidr_block = var.cidr_block
#     subnet_cidr_block = var.sub_cidr_block
#     vpc_id = module.vpc.vpc_id_for_use
#     ami = var.ami_image
#     instance_type = var.instance_type
#     subnet_id = module.subnet.subnet_id
#     allocated_storage = var.allocated_storage
#     db_name = var.db_name
#     engine = var.engine
#     engine_version = var.engine_version
#     instance_class = var.instance_class
#     username = var.username
#     password = var.password
#     parameter_group_name = var.parameter_group_name
#     skip_final_snapshot = var.skip_final_snapshot
#   }
# }