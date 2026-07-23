resource "aws_instance" "exemplo" {
    ami = data.aws_ami.exemplo.id
    instance_market_options {
      market_type = "spot"
      spot_options {
        max_price = 0.0031
      }
    }
    instance_type = "t4g.nano"
    tags = {
        Name = "Máquina Virtual EC2 Spot"
    }
}