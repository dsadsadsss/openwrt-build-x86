#!/bin/bash
#=================================================
# 自定义
#=================================================

# 修改openwrt登陆地址,把下面的 10.0.0.1 修改成你想要的就可以了
sed -i 's/192.168.1.1/10.1.1.254/g' package/base-files/files/bin/config_generate

# 默认打开 WiFi
sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# openclash
svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash  package/luci-app-openclash

