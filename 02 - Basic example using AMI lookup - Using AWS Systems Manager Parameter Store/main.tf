resource "aws_instance" "exemplo" {
    ami = "resolve:ssm:/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
    instance_type = "t3.micro"

    tags = {
        Name = "Segunda Máquina Virtual EC2"
    }
}