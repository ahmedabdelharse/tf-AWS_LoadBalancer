resource "aws_default_security_group" "default-sg" {
    vpc_id = var.vpc_id
    #vpc_id = each.value.vpc-id
    tags = {
    Name = var.default-sg-name
    }
    # for_each = var.default_sg-info
    # ingress {
    # from_port   = each.value.ingress-from_port
    # protocol    = each.value.ingress-protocol
    # to_port     = each.value.ingress-to_port
    # cidr_blocks = [each.value.ingress-cidr_block]
    # }
    # egress {
    # from_port   = each.value.egress-from_port
    # protocol    = each.value.egress-protocol
    # to_port     = each.value.egress-to_port
    # cidr_blocks = [each.value.egress-cidr_block]
    # }\
    ingress {
    from_port   = var.ingress-from_port #need to test list [var]
    protocol    = var.ingress-protocol
    to_port     = var.ingress-to_port
    cidr_blocks = [var.ingress-cidr_block]
    }
    egress {
    from_port   = var.egress-from_port
    protocol    = var.egress-protocol
    to_port     = var.egress-to_port
    cidr_blocks = [var.egress-cidr_block]
    }
}

resource "aws_default_route_table" "default-routetable" {
  #default_route_table_id = var.vpc-default_route_table_id
  default_route_table_id = var.default_route_table_id
  #for_each = var.default_rt-info
  route {
    cidr_block = var.rt-route-cidr_block
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = var.default-rt-name
  }
}
# resource "aws_route" "route_pub" {
#   #for_each = var.route_pub-info
#   # route_table_id         = each.value.route_table_id
#   # destination_cidr_block = each.value.destination_cidr_block
#   # gateway_id             = each.value.igw-id
#   route_table_id         = var.route-route_table_id
#   destination_cidr_block = var.route-destination_cidr_block
#   gateway_id             = var.igw_id
# }
resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id
  #for_each = var.igw-info
  tags = {
  Name = var.igw-name
  }
}

resource "aws_nat_gateway" "nat" {
  # count = 2
  # subnet_id = element([var.nat-subnet_ids], count.index)
  #-> allocation_id = aws_eip.example.id
  #allocation_id = aws_eip.eip[count.index].id
  allocation_id = aws_eip.eip[count.index].id
  #count    = length(var.nat-subnet_info)
  #for_each = toset(var.nat-subnet_info)
  #subnet_id = var.nat-subnet_info[count.index]
  #secondary_private_ip_addresses = [  ]
  #for_each = toset(var.nat-subnet_ids)
  count = length(var.nat-subnet_ids)
  subnet_id = var.nat-subnet_ids[count.index]
  # Name = each.value.Name
  # }
  depends_on = [aws_eip.eip]
}
resource "aws_eip" "eip" {
    #domain = "vpc"
    count = 2
    depends_on = [aws_internet_gateway.igw]
}