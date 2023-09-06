output "kubeconfig" {
  description = "Kubeconfig file content for connecting to the EKS cluster"
  value       = module.eks.kubeconfig
}

output "cluster_certificate_authority_data" {
  description = "Cluster certificate authority data for authenticating to the EKS cluster"
  value       = module.eks.cluster_certificate_authority.0.data
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "internet_gateway_id" {
  value = aws_internet_gateway.vpc_igw.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}
