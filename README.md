# tfspin-alicloud-k8s
Spin up an Alibaba Cloud Kubernetes cluster with Terraform.
在阿里云使用 Terraform 创建云上的 Kubernetes 集群，当前框架提供一个简单模块来创建 VPC、VSwitch 和托管 Kubernetes 集群。


Architecture

VPC (10.0.0.0/16)
  └── VSwitch (10.0.1.0/24)
        └── ACK Managed Cluster
              ├── Service CIDR: 172.16.0.0/16
              ├── Pod CIDR:    10.244.0.0/16 (Flannel)
              ├── NAT Gateway (auto-created)
              └── SLB (public API Server)
Prerequisites

Terraform ≥ 1.5.0
Alibaba Cloud account with AccessKey
Quick Start

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

已授权的策略规则:


