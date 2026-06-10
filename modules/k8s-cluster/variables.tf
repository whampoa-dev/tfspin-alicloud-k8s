variable "region" {
  description = "Alicloud region for the cluster."
  type        = string
}

variable "cluster_name" {
  description = "The Kubernetes cluster name."
  type        = string
}

variable "vpc_name" {
  description = "VPC name for the cluster."
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
}

variable "vswitch_name" {
  description = "VSwitch name for the cluster."
  type        = string
}

variable "vswitch_cidr" {
  description = "CIDR block for the VSwitch."
  type        = string
}

variable "zone_id" {
  description = "Zone for VSwitch and resources."
  type        = string
}

variable "ack_cluster_spec" {
  description = "ACK cluster specification."
  type        = string
}

variable "node_instance_types" {
  description = "Worker node instance types."
  type        = list(string)
}

variable "node_count" {
  description = "Number of worker nodes."
  type        = number
}

variable "service_cidr" {
  description = "Service network CIDR block."
  type        = string
}

variable "pod_cidr" {
  description = "Pod network CIDR block (Flannel)."
  type        = string
}

variable "worker_password" {
  description = "SSH login password for worker nodes."
  type        = string
  sensitive   = true
}
