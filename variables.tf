variable "vpc_cidr_block" {  
  default = "10.0.0.0/16"
  type = string
}
variable "demo_vpc" {
  default = "demo-vpc"
  type = string
}
variable "public_subnet_tag" {
  description = "this is a tag for public subnet"
  default = "public subnet"
  type = string
}

variable "public-subnet-az" {
    type = string
    default = "us-east-1a"
}

variable "public_subnet-1_cidr" {
    type = string
    default = "10.0.0.0/24"
}

variable "public_ip_on_launch" {
  description = "true or false whether to launch public ip for instances"
  type = string
  default = "true"
}