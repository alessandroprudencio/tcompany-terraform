resource "aws_vpc" "new-vpc" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

data "aws_availability_zones" "available" {}

# output "az" {
#   value = data.aws_availability_zones.available.names
# }

resource "aws_subnet" "subnets" {
  count = 2

  availability_zone = data.aws_availability_zones.available.names[count.index]

  vpc_id = aws_vpc.new-vpc.id

  cidr_block = "10.0.${count.index}.0/24"

  map_public_ip_on_launch = true

  depends_on = [aws_vpc.new-vpc]

  tags = {
    Name = "${var.prefix}-subnet-${count.index + 1}"
  }
}

resource "aws_internet_gateway" "new-gw" {
  vpc_id = aws_vpc.new-vpc.id

  depends_on = [aws_vpc.new-vpc]

  tags = {
    Name = "${var.prefix}-igw"
  }
}

resource "aws_route_table" "new-rtb" {
  vpc_id = aws_vpc.new-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new-gw.id
  }

  tags = {
    Name = "${var.prefix}-rtb"
  }
}

resource "aws_route_table_association" "new-rtb-association" {
  count = 2

  subnet_id      = aws_subnet.subnets.*.id[count.index]
  route_table_id = aws_route_table.new-rtb.id
}

# resource "aws_lb" "nginx_lb" {
#   name               = "nginx-service"
#   load_balancer_type = "application"
#   subnets            = aws_subnet.subnets[*].id

#   security_groups = [aws_security_group.sg.id]

#   tags = {
#     Name = "nginx-service"
#   }
# }
