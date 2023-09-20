#VPC variables

variable "vpc_cidr" {
    default = "10.0.0.0/16"
    description = "vpc cidr block"
    type = string
  
}

variable "pub_sub_az1" {
    default = "10.0.0.0/24"
    description = "Public VPC az1 subnet"
    type = string
  
}

variable "pub_sub_az2" {
    default = "10.0.1.0/24"
    description = "public az2 subnet"
    type = string
  
}

variable "pri_sub_az1" {
    default = "10.0.2.0/24"
    description = "private VPC az1 subnet"
    type = string
  
}

variable "pri_sub_az2" {
    default = "10.0.3.0/24"
    description = "private az2 subnet"
    type = string
  
}

variable "pri_data_sub_az1" {
    default = "10.0.4.0/24"
    description = "private data VPC az1 subnet"
    type = string
  
}

variable "pri_data_sub_az2" {
    default = "10.0.5.0/24"
    description = "private data az2 subnet"
    type = string
  
}