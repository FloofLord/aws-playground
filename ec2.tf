resource "aws_instance" "myec2" {
  ami = "ami-0c614dee691cbbf37"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.public.id
  security_groups = [aws_security_group.sg-public.id]
  associate_public_ip_address = true
  tags = {
    Name = "myEC2"
  }
  
}


# resource "aws_" "name" {
  
# }



# resource "aws_key_pair" "name" {
#   key_name = "my-key-pair"
#   public_key = file("${path.module}/public_key.pub")
# }

