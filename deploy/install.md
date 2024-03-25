# deploy AWX 部署开源图形化运维工具

## 安装方式

- lastest awx 只能在 k8s 环境下面安装，需要参考最新的 awx 官方文档，参考 gke/install_awx_to_gke.sh (暂时被弃用，和 gke 不是很兼容) 和 minikube/install_awx_with_operator.sh (性能一般，但是可用)
- 18.0.0 以前的 awx 可以直接通过 docker 安装，比较流畅，但版本较低，见 docker/install_awx.sh