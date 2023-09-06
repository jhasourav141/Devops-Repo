provider "aws" {
  region = var.aws_region
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = var.cluster_name
  cluster_version = var.eks_version
  subnets         = module.vpc.private_subnets + module.vpc.public_subnets
  vpc_id          = module.vpc.vpc_id

  tags = {
    "Environment" = "Dev"
  }
}

resource "aws_eks_node_group" "t3_medium_nodes" {
  for_each = toset(["NodeGroup1"])

  cluster_name    = module.eks.cluster_id
  node_group_name = "t3-medium-ng"
  node_role_arn   = module.eks.eks_node_group_role

  node_type = "t3.medium"

  scaling_config {
    min_size = 2
    desired_size = 2
    max_size = 10
  }

  remote_access {
    ec2_ssh_key = "your-ssh-key"
  }
}

resource "aws_eks_node_group" "t3_large_nodes" {
  for_each = toset(["NodeGroup2"])

  cluster_name    = module.eks.cluster_id
  node_group_name = "t3-large-ng"
  node_role_arn   = module.eks.eks_node_group_role

  node_type = "t3.large"

  scaling_config {
    min_size = 2
    desired_size = 2
    max_size = 10
  }

  remote_access {
    ec2_ssh_key = "your-ssh-key"
  }
}
