variable "project" {
    type = string

}

variable "environment" {
    type = string

}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
  
}

variable "public_sub_cidr" {
    type = list(string)
    default = [ "10.0.1.0/24", "10.0.2.0/24" ]
}

variable "private_sub_cidr" {
    type = list(string)
    default = [ "10.0.11.0/24", "10.0.12.0/24" ]
  
}

variable "database_sub_cidr" {
    type = list(string)
    default = [ "10.0.21.0/24", "10.0.22.0/24" ]
  
}