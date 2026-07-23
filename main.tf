resource "aws_instance" "exemplo" {
    ami = data.aws_ami.amazon_linux.id
    instance_type = "t3.micro"

    tags = {
        Name = "Primeira Máquina Virtual EC2"
    }
}