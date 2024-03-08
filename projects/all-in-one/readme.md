# All in one 部署

## 步骤

1.`PROTO_VERSION=$(git submodule status | cut -d' ' -f 2) MIX_ENV=prod RELEASE_COOKIE=cookie123 DATA_VERSION=123 mix release m1x --overwrite` release版本编译
2. `mv _build/prod/m1x-*.tar.gz  m1x.tar.gz`
3. 用 `gsutil` 上传到 google storage 
4. 执行 playbook 部署 all-in-one m1x 项目到指定 inventory
