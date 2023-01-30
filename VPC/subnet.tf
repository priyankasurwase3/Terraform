resource "aws_subnet" "pub_sub" {
  vpc_id     = aws_vpc.myvpc.id
  count = 2
   map_public_ip_on_launch = true
  cidr_block = var.pub_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "pub_sub-${count.index+1}"
  }
}

resource "aws_subnet" "pri_sub" {
  vpc_id     = aws_vpc.myvpc.id
  count = 2
  cidr_block = var.pri_cidr_block[count.index]
  availability_zone       = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "pri_sub-${count.index+1}"
  }
}