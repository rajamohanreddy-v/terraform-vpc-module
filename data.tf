
data "aws_availability_zones" "available_zones" {
  state = "available"
}

data "aws_vpc" "default" {
    default = true
}
 
 data "aws_route_table" "default" {
  vpc_id = data.aws_vpc.default.id
 }