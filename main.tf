module "k8s_cluster" {
  source = "./modules/k8s-cluster"

  region              = var.region
  cluster_name        = var.cluster_name
  vpc_name            = var.vpc_name
  vpc_cidr            = var.vpc_cidr
  vswitch_name        = var.vswitch_name
  vswitch_cidr        = var.vswitch_cidr
  zone_id             = var.zone_id
  ack_cluster_spec    = var.ack_cluster_spec
  node_instance_types = var.node_instance_types
  node_count          = var.node_count
  service_cidr        = var.service_cidr
  pod_cidr            = var.pod_cidr
  worker_password     = var.worker_password
  providers = {
    alicloud = alicloud
  }
}
