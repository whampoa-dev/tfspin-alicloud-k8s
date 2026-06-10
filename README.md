# tfspin-alicloud-k8s

Spin up an Alibaba Cloud **ACK managed Kubernetes** cluster with Terraform.

## Architecture

```
VPC (10.0.0.0/16)
  └── VSwitch (10.0.1.0/24)
        └── ACK Managed Cluster
              ├── Service CIDR: 172.16.0.0/16
              ├── Pod CIDR:    10.244.0.0/16 (Flannel)
              ├── NAT Gateway (auto-created)
              └── SLB (public API Server)
```

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/downloads) ≥ 1.5.0
- [Alibaba Cloud account](https://www.alibabacloud.com/) with AccessKey

## Quick Start

```bash
# 1. Clone
git clone git@github.com:whampoa-dev/tfspin-alicloud-k8s.git
cd tfspin-alicloud-k8s

# 2. Create your variables file
cp terraform.tfvars.example terraform.tfvars
# Edit terraform.tfvars — set your worker_password (and region/zone if needed)

# 3. Authenticate
export ALICLOUD_ACCESS_KEY="your-access-key"
export ALICLOUD_SECRET_KEY="your-secret-key"
export ALICLOUD_REGION="cn-hongkong"

# 4. Deploy
terraform init
terraform plan
terraform apply
```

## Variables

| Variable | Default | Description |
|---|---|---|
| `region` | `cn-hongkong` | Alibaba Cloud region |
| `cluster_name` | `tfspin-alicloud-k8s` | K8s cluster name |
| `vpc_name` | `tfspin-k8s-vpc` | VPC name |
| `vpc_cidr` | `10.0.0.0/16` | VPC CIDR block |
| `vswitch_name` | `tfspin-k8s-vswitch` | VSwitch name |
| `vswitch_cidr` | `10.0.1.0/24` | VSwitch CIDR block |
| `zone_id` | `cn-hongkong-g` | Availability zone |
| `ack_cluster_spec` | `ack.pro.small` | ACK cluster spec |
| `node_instance_types` | `["ecs.t5-lc2m1.nano"]` | Worker instance types |
| `node_count` | `1` | Number of worker nodes |
| `service_cidr` | `172.16.0.0/16` | K8s Service CIDR |
| `pod_cidr` | `10.244.0.0/16` | Pod CIDR (Flannel) |
| `worker_password` | — | **Required** — SSH password for workers |

## Outputs

| Output | Description |
|---|---|
| `vpc_id` | VPC ID |
| `vswitch_id` | VSwitch ID |
| `cluster_id` | ACK cluster ID |
| `kube_config` | Kubeconfig YAML (sensitive) |

## Clean Up

```bash
terraform destroy
```
