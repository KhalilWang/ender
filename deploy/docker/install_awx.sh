sudo apt-get install python3-venv docker docker-compose -y
python3 -m venv `pwd`/venv/

source venv/bin/activate
pip3 install "cython<3.0.0" wheel && pip3 install pyyaml==5.4.1 --no-build-isolation
pip3 install -r requirements.txt
wget https://github.com/ansible/awx/archive/refs/tags/17.0.0.tar.gz

tar -xzvf 17.0.0.tar.gz
pip3 install ansible 

# 去 awx-17.0.0/installer 下修改 inventory 的 admin 密码，然后
# 修改 inventory 的 python 解释器路径为 venv 中的二进制路径
# ansible-playbook -i inventory install.yml
