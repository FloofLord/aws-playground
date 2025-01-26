# Create a VPC
resource "aws_vpc" "my-new-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "my-new-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.my-new-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public"
  }
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.my-new-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "private"
  }
}
