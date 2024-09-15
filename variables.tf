variable "region" {}
#variable "availability_zone" {}
variable "instance_type" {}
#variable "vpc-info" {}
variable "vpc-cidr_block" {}
variable "vpc-name" {}
variable "subnet-info" {}
#networking
variable "default-sg-name" {}
variable "default_sg-info" {}

variable "default-rt-name" {}
#variable "default_rt-info" {}
variable "rt-route-cidr_block" {}
#variable "route_pub-info" {}
# variable "route-route_table_id" {}
# variable "route-destination_cidr_block" {}

#variable "igw-info" {}
variable "igw-name" {}
#variable "nat-subnet_info" {}

# -> EC2
variable "data-most_recent" {}
variable "data-owners" {}
variable "data-filter_name" {}
variable "data-filter_value" {}
#variable "instance_info" {}
variable "private-instance-associate_public_ip_address"{}
variable "public-instance-associate_public_ip_address"{}

variable "instance-sg"{}
variable "instance-name"{}

