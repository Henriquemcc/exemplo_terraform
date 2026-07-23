resource "aws_vpc" "minha_vpc" {
    cidr_block = "172.16.0.0/16"

    tags = {
      Name = "Minha VPC"
    }
}

resource "aws_subnet" "minha_subnet" {
    vpc_id = aws_vpc.minha_vpc.id
    cidr_block = "172.16.10.0/24"
    availability_zone = "us-east-1a"

    tags = {
        Name = "Minha Subnet"
    }
}

resource "aws_instance" "minha_ec2" {
    ami = data.aws_ami.amzn-linux-2023-ami.id
    instance_type = "c6a.2xlarge"
    subnet_id = aws_subnet.minha_subnet.id

    cpu_options {
      core_count = 2
      threads_per_core = 2
    }

    tags = {
      Name = "Minha EC2"
    }
}