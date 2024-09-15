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
    #default_sg-info = var.default_sg-info
    ingress-cidr_block = var.ingress-cidr_block
    ingress-from_port = var.ingress-from_port
    ingress-protocol = var.ingress-protocol
    ingress-to_port = var.ingress-to_port
    egress-cidr_block = var.egress-cidr_block
    egress-from_port = var.egress-from_port
    egress-protocol = var.egress-protocol
    egress-to_port = var.egress-to_port

    default_route_table_id = module.VPC.vpc-out.default_route_table_id
    default-rt-name = var.default-rt-name
    rt-route-cidr_block = var.rt-route-cidr_block
    #igw_id = module.NETWORKING.igw-out.id
    # route-route_table_id = var.route-route_table_id
    # route-destination_cidr_block = var.route-destination_cidr_block
    #igw-info = var.igw-info
    igw-name = var.igw-name
    #nat-subnet_info = module.SUBNET.private-subnet-ids-ec2
    nat-subnet_ids = module.SUBNET.private-subnet-ids-ec2
}
# module "private-EC2" {
#     source = "./EC2"
#     data-most_recent = var.instance-data-most_recent
#     data-owners = var.instance-data-owners
#     data-filter_name = var.instance-data-filter_name
#     data-filter_value = var.instance-data-filter_value
#     #isntance-info = var.instance_info
#     instance-subnet_ids = module.SUBNET.private-subnet-ids-ec2
#     instance-type = var.instance_type
#     instance-sg = module.NETWORKING.default-sg-out.id
#     instance-associate_public_ip_address = var.private-instance-associate_public_ip_address
#     instance-name = "private-ec2"
# }
# # module "public-EC2" {
# #     source = "./EC2"
# #     data-most_recent = var.instance-data-most_recent
# #     data-owners = var.instance-data-owners
# #     data-filter_name = var.instance-data-filter_name
# #     data-filter_value = var.instance-data-filter_value
# #     #isntance-info = var.instance_info
# #     instance-subnet_ids = module.SUBNET.public-subnet-ids-lb
# #     instance-type = var.instance_type
# #     instance-sg = module.NETWORKING.default-sg-out-id
# #     instance-associate_public_ip_address = var.public-instance-associate_public_ip_address
# #     instance-name = "public-ec2"
# # }