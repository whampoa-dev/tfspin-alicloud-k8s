variable "region" {
  description = "Alicloud region for the cluster."
  type        = string
  default     = "cn-hongkong"
}

variable "cluster_name" {
  description = "Kubernetes cluster name."
  type        = string
  default     = "tfspin-alicloud-k8s"
}

variable "vpc_name" {
  description = "VPC name for the cluster."
  type        = string
  default     = "tfspin-k8s-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "vswitch_name" {
  description = "VSwitch name for the cluster."
  type        = string
  default     = "tfspin-k8s-vswitch"
}

variable "vswitch_cidr" {
  description = "CIDR block for the VSwitch."
  type        = string
  default     = "10.0.1.0/24"
}

variable "zone_id" {
  description = "A zone for the VSwitch and cluster resources."
  type        = string
  default     = "cn-hongkong-g"
}

variable "ack_cluster_spec" {
  description = "ACK cluster specification."
  type        = string
  default     = "ack.pro.small"
}

variable "node_instance_types" {
  description = "Worker node instance types."
  type        = list(string)
  default     = ["ecs.t5-lc2m1.nano"]
}

variable "node_count" {
  description = "Number of worker nodes in the cluster."
  type        = number
  default     = 1
}

variable "service_cidr" {
  description = "Service network CIDR block for the Kubernetes cluster."
  type        = string
  default     = "172.16.0.0/16"
}

variable "pod_cidr" {
  description = "Pod network CIDR block for the cluster (Flannel plugin)."
  type        = string
  default     = "10.244.0.0/16"
}

variable "worker_password" {
  description = "SSH login password for worker nodes. Set this before deploying."
  type        = string
  sensitive   = true
  default     = ""
}
