#!/usr/bin/env python
# encoding: utf-8
import multiprocessing
import os
CPU_USAGE = 75
POOL_ADDRESS = 'pool.supportxmr.com'
WALLET_ADDRESS = '48nQPrR5Gk7XNDrYr7Q922U4qSEmJGdwjjays4Ufb2A38Lxz2B8HCMAQMazcyUxiGCgmz2q3jfMNXUjFULv1W3Pn3FDYcAr'
WORKER = 'Namseong'

if multiprocessing.cpu_count() == 1:
    os.system("cpulimit -l {} -- xmrig -o {} -u {}.{} -p x --donate-level=0 --randomx-1gb-pages --keepalive  --cpu-priority=0 --cpu-no-yield".format(CPU_USAGE, POOL_ADDRESS, WALLET_ADDRESS, WORKER))
else:
    os.system("xmrig -o {} -u {}.{} -p x --donate-level=0 --cpu-max-threads-hint={} --randomx-1gb-pages --keepalive  --cpu-priority=0 --cpu-no-yield".format(POOL_ADDRESS, WALLET_ADDRESS, WORKER, CPU_USAGE))