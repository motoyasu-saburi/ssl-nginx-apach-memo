#!/bin/bash

# 事前にApache, ARP, ARP-utilライブラリを入手してどうディレクトリに展開すること。
HTTPD=
# httpdのバージョンはお好み。2.4.xx 系からSSL関連のアップデートが多くされている
tar zxvf httpd-2.4.16.tar.gz
cd httpd-2.4.16/srclib
tar zxvf ../../apr-1.5.2.tar.gz
ln -s apr-1.5.2/ apr
tar zxvf ../../apr-util-1.5.4.tar.gz
ln -s apr-util-1.5.4/ apr-util

# Dockerfileでは、ここら辺のconfigureがない
./configure \
  --prefix=/opt/httpd \
  --with-included-apr \
  --enable-ssl \
  --with-ssl=/opt/openssl-1.0.1p \
  --enable-ssl-staticlib-deps \
  --enable-mods-static=ssl

make
sudo make install

