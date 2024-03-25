# ds 批量部署

## 步骤

 1. 执行 ds-vm-create.yml 创建对应的 gce 实例，然后会直接运行 (需要在模板的变量中定义 vm_instances，格式在后面列出)

## 变量示意
```yml
vm_instances:
  - host_name: "dsa-01"
    zone: "asia-southeast1-b"
    machine_type: "e2-custom-8-16384"
  - host_name: "dsa-02"
    zone: "asia-east1-b"
    machine_type: "e2-custom-8-16384"
```
将上述内容填充至 ds-vm-create 模板的变量中执行任务，可允许创建多个实例