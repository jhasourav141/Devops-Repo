module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "demo-vpc"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b"]  # Adjust AZs as needed
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]  # Adjust private CIDRs as needed
  public_subnets  = ["10.0.3.0/24", "10.0.4.0/24"]  # Define public subnets here

  tags = {
    "Terraform"   = "true"
    "Environment" = "Dev"
  }
}

resource "aws_internet_gateway" "vpc_igw" {
  vpc_id = module.vpc.vpc_id
}

resource "aws_route_table" "public" {
  vpc_id = module.vpc.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.vpc_igw.id
  }
}

resource "aws_subnet" "public" {
  count             = length(module.vpc.public_subnets)
  vpc_id            = module.vpc.vpc_id
  cidr_block        = element(module.vpc.public_subnets, count.index)
  availability_zone = element(module.vpc.azs, count.index)

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-${count.index + 1}"
  }

  depends_on = [aws_route_table.public]
}
