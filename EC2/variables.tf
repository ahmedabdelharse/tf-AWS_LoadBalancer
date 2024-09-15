
variable "data-most_recent" { type = bool}
variable "data-owners" {}
variable "data-filter_name" {}
variable "data-filter_value" {}
# variable "instance-subnet_id" {}
variable "instance-type" {}
# variable "instance-a_z" {}
variable "instance-sg" {}
variable "instance-associate_public_ip_address" {}
variable "instance-name" {}

# variable "isntance-info" {
#   type = map(object({
#         #instance-subnet_id = string
#        # instance-type = string
#         #instance-a_z  = string
#        # instance-sg = string
#         #instance-associate_public_ip_address = bool
#         instance-name = string
#     }))
# }
variable "instance-subnet_ids" {
    description = "List of subnet IDs"
    type = list(string)
}