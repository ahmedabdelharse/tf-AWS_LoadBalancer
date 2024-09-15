module "VPC" {
    source = "./VPC"
    cidr_block = var.vpc-cidr_block
    name = var.vpc-name
}
module "SUBNET" {
    source = "./SUBNET"
   # vpc_id = module.VPC.vpc_id
    vpc_id = module.VPC.vpc-out.id
    subnet-info = var.subnet-info
}
module "NETWORKING" {
    source = "./NETWORKING"
    vpc_id = module.VPC.vpc-out.id
    default-sg-name = var.default-sg-name
    default_sg-info = var.default_sg-info
    default_route_table_id = module.VPC.vpc-out.default_route_table_id
    default-rt-name = var.default-rt-name
    rt-route-cidr_block = var.rt-route-cidr_block
    #igw_id = module.NETWORKING.igw-out.id
    # route-route_table_id = var.route-route_table_id
    # route-destination_cidr_block = var.route-destination_cidr_block
    #igw-info = var.igw-info
    igw-name = var.igw-name
    nat-subnet_info = module.SUBNET.private-subnet-ids-ec2
}
module "private-EC2" {
    source = "./EC2"
    data-most_recent = var.data-most_recent
    data-owners = var.data-owners
    data-filter_name = var.data-filter_name
    data-filter_value = var.data-filter_value
    #isntance-info = var.instance_info
    instance-subnet_ids = module.SUBNET.private-subnet-ids-ec2
    instance-type = var.instance_type
    instance-sg = module.NETWORKING.default-sg
    instance-associate_public_ip_address = var.private-instance-associate_public_ip_address
    instance-name = var.instance-name
}
module "public-EC2" {
    source = "./EC2"
    data-most_recent = var.data-most_recent
    data-owners = var.data-owners
    data-filter_name = var.data-filter_name
    data-filter_value = var.data-filter_value
    #isntance-info = var.instance_info
    instance-subnet_ids = module.SUBNET.public-subnet-ids-lb
    instance-type = var.instance_type
    instance-sg = module.NETWORKING.default-sg
    instance-associate_public_ip_address = var.public-instance-associate_public_ip_address
    instance-name = var.instance-name
}
