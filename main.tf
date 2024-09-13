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
    default_rt-info = var.default_rt-info
    igw_id = module.NETWORKING.igw-out
    # route-route_table_id = var.route-route_table_id
    # route-destination_cidr_block = var.route-destination_cidr_block
    igw-info = var.igw-info
}