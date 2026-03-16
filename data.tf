
data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_vpc" "default" {
    default = true
}
 