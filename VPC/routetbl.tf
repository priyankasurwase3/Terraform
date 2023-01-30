resource "aws_route_table" "pubrt" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pubrt"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id

  tags = {
    Name = "igw"
  }
}
resource "aws_route_table_association" "a" {
  count = 2
  subnet_id      = aws_subnet.pub_sub.*.id[count.index]
  route_table_id = aws_route_table.pubrt.id
}