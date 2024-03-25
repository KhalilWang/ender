# 更新 google-cloud-ops-agent 配置

## 步骤

 1. 先去 gcp 的 monitoring 面板查看目标机器是否安装了 ops-agent，如果没有装可以在线安装
 2. update_ops_agent_config.yml 执行到安装了 agent 的清单中即可替换配置

## 变量示意
`config/ops_agent_config.yml` 是我的配置示例，如何配置 ops_agent 参考谷歌文档