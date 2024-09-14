variable "vpc_id" {}
variable "default-sg-name" {}
variable "default_sg-info" {
    type = map(object({
        #vpc-id = string
        ingress-from_port = string
        ingress-protocol = string
        ingress-to_port = string
        ingress-cidr_block = string
        egress-from_port = string
        egress-protocol = string
        egress-to_port = string
        egress-cidr_block = string
        #Name = string
    }))
}
#variable "vpc-default_route_table_id" {}
variable "default_route_table_id" {}
#variable "rt-route-cidr_block" {}
variable "default-rt-name" {}
variable "rt-route-cidr_block" {}
# variable "default_rt-info" {
#     type = map(object({
#         #default_route_table_id = string
#         rt-route-cidr_block = string
#        # igw-id = string
#         #Name = string
#     }))
# }
variable "igw_id" {}
# variable "route_pub-info" {
#     type = map(object({
#         route_table_id = string
#         destination_cidr_block = string
#         igw-id = string
#     }))
# }
# variable "route-route_table_id" {}
# variable "route-destination_cidr_block" {}
#variable "igw-id" {}

#variable "igw_id" {}
# variable "igw-info" {
#     type = map(object({
#        # vpc_id = string
#         Name = string
#     }))
# }
variable "igw-name" {}