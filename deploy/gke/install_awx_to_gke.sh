# **被弃用** 问题太多
# 安装helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod +x get_helm.sh
get_helm.sh
helm repo add awx-operator https://ansible.github.io/awx-operator/

# 集群创建命令
gcloud beta container --project "matr1x-fire-development" \
  clusters create-auto "ops-autopilot" \
  --region "asia-southeast1" \
  --release-channel "regular" \
  --network "projects/matr1x-fire-development/global/networks/default" \
  --subnetwork "projects/matr1x-fire-development/regions/asia-southeast1/subnetworks/default" \
  --cluster-ipv4-cidr "/17" \
  --binauthz-evaluation-mode=DISABLED \
  --service-account=ops-admin@matr1x-fire-development.iam.gserviceaccount.com

# 在 gcloud auth list 的当前账号有权限时添加 container cluster
gcloud container clusters get-credentials ops-cluster --region asia-southeast1 --project matr1x-fire-development

# 参考 https://linux.cn/article-15941-1.html
helm repo update
helm install ansible-awx-operator awx-operator/awx-operator -n awx --create-namespace

# 发现 awx-operator 会因为 OOM Crash 掉，使用以下命令提高其内存限制
# helm upgrade ansible-awx-operator awx-operator/awx-operator -n awx \
#   --set operator.resources.limits.memory=2048Mi,operator.resources.requests.memory=512Mi

# **被弃用** 问题太多

