data "aws_ami" "amazon_linux" {
    most_recent = true

    filter {
      name = "name"
      values = ["al2023"]
    }

    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }

    owners = ["amazon"]
}