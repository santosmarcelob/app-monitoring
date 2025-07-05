resource "aws_route_table" "rtb" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }

  tags = {
    Name = "RTB-${var.tags}"
  }
}

resource "aws_route_table_association" "association_rtb" {
  subnet_id      = var.subnet_id
  route_table_id = aws_route_table.rtb.id
}