# All in one 部署

## 步骤

 1.`PROTO_VERSION=$(git submodule status | cut -d' ' -f 2) MIX_ENV=prod RELEASE_COOKIE=cookie123 DATA_VERSION=123 mix release m1x --overwrite`  编译当前 release 版本
 2. `mv _build/prod/m1x-*.tar.gz  m1x.tar.gz`
 3. 用 `gsutil cp m1x.tar.gz gs://matr1x-fire-server-pkg/m1x-awx-deploy.tar.gz` 上传到 google storage
 4. 执行 create-all-in-one-vm.yml 创建对应的 gce 实例 (需要在模板的变量中定义 vm_instances，格式在后面列出)
 5. 执行 deploy-all-in-one.yml 到刚创建的 gce 实例主机中 (需要添加实例主机到清单中，然后选择清单执行)

## 变量示意
```yml
vm_instances:
 - host_name: aio-01
   zone: asia-southeast1-b
   machine_type: e2-standard-4
```

将上述内容填充至 create-all-in-one-vm 模板的变量中执行任务，可允许创建多个实例