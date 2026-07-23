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

resource "aws_network_interface" "minha_interface_rede" {
    subnet_id = aws_subnet.minha_subnet.id
    private_ips = ["172.16.10.100"]

    tags = {
        Name = "Interface de Rede Primária"
    }
}

resource "aws_instance" "minha_instancia_ec2" {
    ami = "ami-0b826bb6d96d2afe4"
    instance_type = "t2.micro"

    primary_network_interface {
        network_interface_id = aws_network_interface.minha_interface_rede.id
    }

    credit_specification {
      cpu_credits = "unlimited"
    }
}