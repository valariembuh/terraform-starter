variable "name" {}
variable "ami" {}
variable "instance_type" {}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}
variable "target_group_arn" {}
