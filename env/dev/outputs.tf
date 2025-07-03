# output "dev_outputs" {
#   value = {
#     region = var.region
#     vpc_cidr_block = var.cidr_block
#     subnet_cidr_block = var.sub_cidr_block
#     vpc_id = module.vpc.vpc_id_for_use
#     ami = var.ami_image
#     instance_type = var.instance_type
#     subnet_id = module.subnet.subnet_id
#   }
# }