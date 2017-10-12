#!/bin/bash
sudo bash -c 'echo "nameserver 8.8.8.8" >> /etc/resolvconf/resolv.conf.d/head'
sudo bash -c 'echo "nameserver 8.8.4.4" >> /etc/resolvconf/resolv.conf.d/head'
