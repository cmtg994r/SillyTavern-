#!/bin/bash

echo -e "\033[0;31m开魔法！开魔法！开魔法！\033[0m\n"

read -p "确保开了魔法后按回车继续"

current=/data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu

apt update

apt upgrade

# 安装proot-distro
pkg install proot-distro -y

# 创建并安装Ubuntu
proot-distro install ubuntu

# Check Ubuntu installed successfully
 if [ ! -d "$current" ]; then
   echo "Ubuntu安装失败了，请更换魔法或者手动安装Ubuntu喵~"
    exit 1
 fi

    echo "Ubuntu成功安装到Termux"

echo "正在安装相应软件喵~"

pkg install git vim curl xz-utils -y

cd $current/root

echo "正在为Ubuntu安装node喵~"
if [ ! -d node-v20.10.0-linux-arm64.tar.xz ]; then
    curl -O https://nodejs.org/dist/v20.10.0/node-v20.10.0-linux-arm64.tar.xz

tar xf node-v20.10.0-linux-arm64.tar.xz

echo "export PATH=\$PATH:/root/node-v20.10.0-linux-arm64/bin" >>$current/etc/profile
fi

git clone https://github.com/cmtg994r/SillyTavern.git

git clone https://github.com/teralomaniac/clewd

curl -O https://raw.githubusercontent.com/hopingmiao/termux_using_Claue/main/sac.sh

if [ ! -f "$current/root/sac.sh" ]; then
   echo "启动文件下载失败了，换个魔法或者手动下载试试吧"
   exit
fi

echo "bash /root/sac.sh" >>$current/root/.bashrc

echo "proot-distro login ubuntu" >>/data/data/com.termux/files/home/.bashrc

source /data/data/com.termux/files/home/.bashrc

exit
