resource "aws_subnet" "subnets" {
  vpc_id = var.vpc_id
  cidr_block = var.subnet_cidr_block
  # availability_zone = "${var.dev_region}a"
  # map_public_ip_on_launch = true  

  tags = {
    Name = "subnets"
  }
}


# resource "aws_internet_gateway" "igw" {
#   vpc_id = var.vpc_id
#   tags = {
#     Name = "igw"
#   }
# }

# resource "aws_route_table" "public" {
#   vpc_id = var.vpc_id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.igw.id
#   }
# }


# resource "aws_security_group" "ec2" {
#   name        = "ec2-access"
#   description = "Allow SSH and HTTP from specific IP"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     # cidr_blocks = [var.my_public_ip]
#   }


#   ingress {
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     # cidr_blocks = [var.my_public_ip]
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }