resource "aws_instance" "web" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    # vpc_security_group_ids = var.aws_security_group.ec2.id

    tags = {
        Name = "EC2-terra"
  }
}