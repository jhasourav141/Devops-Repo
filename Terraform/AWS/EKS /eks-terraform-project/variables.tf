variable "aws_region" {
  description = "AWS region for resources"
  default     = "us-east-1"  # Change to your desired region
}

variable "cluster_name" {
  description = "Name for the EKS cluster"
  default     = "my-eks-cluster"
}

variable "eks_version" {
  description = "EKS cluster version"
  default     = "1.21"  # Update to the desired EKS version
}
