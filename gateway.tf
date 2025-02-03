resource "aws_internet_gateway" "my-internet" {
    vpc_id = aws_vpc.my-new-vpc.id
    tags = {
        Name = "Internet Gateway"
    }
  
}

resource "aws_route_table" "public_route" {
    vpc_id = aws_vpc.my-new-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-internet.id
    }
  
  tags = {
    Name = "PublicRouteTable"
  }
}


resource "aws_route_table_association" "public" {
    subnet_id = aws_subnet.public.id
    route_table_id = aws_route_table.public_route.id
  
}

resource "aws_route_table" "private_route" {
    vpc_id = aws_vpc.my-new-vpc.id
    # route {
    #     cidr_block = "0.0.0.0/0"
    #     gateway_id = aws_internet_gateway.my-internet.id
    # }
  
  tags = {
    Name = "PrivateRouteTable"
  }
}


resource "aws_route_table_association" "private" {
    subnet_id = aws_subnet.private.id
    route_table_id = aws_route_table.private_route.id 
}