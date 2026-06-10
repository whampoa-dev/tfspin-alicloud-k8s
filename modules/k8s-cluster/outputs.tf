output "vpc_id" {
  description = "VPC id created for cluster networking."
  value       = alicloud_vpc.this.id
}

output "vswitch_id" {
  description = "VSwitch id created for cluster networking."
  value       = alicloud_vswitch.this.id
}

output "cluster_id" {
  description = "Managed Kubernetes cluster ID."
  value       = alicloud_cs_managed_kubernetes.this.id
}

output "kube_config" {
  description = "Kubeconfig YAML for the managed cluster."
  value       = alicloud_cs_managed_kubernetes.this.kube_config
  sensitive   = true
}

