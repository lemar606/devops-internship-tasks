resource "aws_subnet" "public" {
  vpc_id            = var.vpc_id
  cidr_block        = var.subnet_cidr_block
  availability_zone = var.availability_zone
  map_public_ip_on_launch = true
  tags = { Name = "${var.wordpress_prefix}subnet" }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  tags = { Name = "${var.wordpress_prefix}igw" }
}

resource "aws_route_table" "public_rt" {
  vpc_id = var.vpc_id
  tags = { Name = "${var.wordpress_prefix}rtb" }
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "wp_ec2_sg" {
  name        = "${var.wordpress_prefix}sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "tls_private_key" "wp_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.wp_key.public_key_openssh
}

resource "local_file" "private_key" {
  content  = tls_private_key.wp_key.private_key_pem
  filename = "wordpress-key.pem"
  file_permission = "0400"
  }