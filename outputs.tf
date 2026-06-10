output "vpc_id" {
  description = "VPC id created for cluster networking."
  value       = module.k8s_cluster.vpc_id
}

output "vswitch_id" {
  description = "VSwitch id created for cluster networking."
  value       = module.k8s_cluster.vswitch_id
}

output "cluster_id" {
  description = "Managed Kubernetes cluster ID."
  value       = module.k8s_cluster.cluster_id
}

output "kube_config" {
  description = "Kubeconfig for the managed cluster."
  value       = module.k8s_cluster.kube_config
  sensitive   = true
}
