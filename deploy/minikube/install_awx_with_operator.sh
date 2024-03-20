# 基础环境
sudo apt-get install git cmake docker.io -y

# 安装k8s 和 minikube for ansible operator安装
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

# # 源码下载operator
# git clone https://github.com/ansible/awx-operator.git
# cd awx-operator/
# git checkout tags/2.13.1

# 添加khalil到docker用户组
sudo usermod -aG docker khalil && newgrp docker

# 参考 https://ansible.readthedocs.io/projects/awx-operator/en/latest/installation/creating-a-minikube-cluster-for-testing.html
minikube start --addons=ingress --cpus=4 --install-addons=true --kubernetes-version=stable --memory=8g

# 使用 kustomization.yaml 和 awx-demo.yml 搭建 awx

# 完成上述步骤后使用 port-forward 开放端口 > 后面可以使用 check_port_forward.sh crontab 的形式开放端口
nohup kubectl port-forward --address 0.0.0.0 -n awx service/awx-service 8080:80 

# 获取密码
kubectl get secret awx-admin-password -o jsonpath="{.data.password}" | base64 --decode ; echo