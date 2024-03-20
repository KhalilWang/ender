#!/bin/bash

# 检查是否有端口转发进程正在运行
function check_port_forward() {
    local pid=$(pgrep -f "kubectl port-forward --address 0.0.0.0 -n awx service/awx-service 8080:80")
    if [ -z "$pid" ]; then
        return 1  # 端口转发进程不存在
    else
        return 0  # 端口转发进程存在
    fi
}

# 重启端口转发进程
function restart_port_forward() {
    nohup kubectl port-forward --address 0.0.0.0 -n awx service/awx-service 8080:80 > port-forward.log 2>&1 &
    echo $! > port-forward.pid
    echo "Port forward restarted. PID: $(cat port-forward.pid)"
}

# 检查端口转发进程
if ! check_port_forward; then
    export PATH=/usr/local/bin:$PATH
    echo "Port forward process not found. Restarting..."
    restart_port_forward
fi

# 然后设置 crontab
# chmod +x check_port_forward.sh
# crontab -e
# * * * * * /path/to/check_port_forward.sh