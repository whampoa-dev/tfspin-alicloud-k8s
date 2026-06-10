terraform {
  required_providers {
    alicloud = {
      source  = "aliyun/alicloud"
      version = "~> 1.200"
    }
  }
}

resource "alicloud_vpc" "this" {
  vpc_name   = var.vpc_name
  cidr_block = var.vpc_cidr
}

resource "alicloud_vswitch" "this" {
  vswitch_name = var.vswitch_name
  cidr_block   = var.vswitch_cidr
  vpc_id       = alicloud_vpc.this.id
  zone_id      = var.zone_id
}

# ── ACK Managed Kubernetes Cluster (v1.200.0 compat) ──
resource "alicloud_cs_managed_kubernetes" "this" {
  name                  = var.cluster_name
  cluster_spec          = var.ack_cluster_spec
  worker_vswitch_ids    = [alicloud_vswitch.this.id]
  worker_instance_types = var.node_instance_types
  worker_number         = var.node_count
  password              = var.worker_password
  new_nat_gateway       = true
  service_cidr          = var.service_cidr
  pod_cidr              = var.pod_cidr
  deletion_protection   = false
  enable_rrsa           = true
}

