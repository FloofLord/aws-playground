resource "aws_security_group" "sg" {
  name = "ec-public"
  vpc_id = aws_vpc.my-new-vpc.id

}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.sg.id
  cidr_ipv4 = aws_subnet.public.cidr_block
  from_port = 22
  to_port = 22
  ip_protocol = "tcp"
}

resource "aws_vpc_security_group_egress_rule" "allow_ssh" {
  security_group_id = aws_instance.myec2.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}