#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: eSirPlayground
# Youtube Channel: https://goo.gl/fvkdwm 
#=================================================
#1. Modify default IP
sed -i 's/192.168.1.1/10.1.1.254/g' openwrt/package/base-files/files/bin/config_generate

#2. Clear the login password
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' openwrt/package/lean/default-settings/files/zzz-default-settings

#更换插件名称
#sed -i 's/ShadowSocksR Plus+/科学上网/g' openwrt/package/feeds/small8/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
#sed -i 's/("iStore"),/("应用中心"),/g' openwrt/package/feeds/small8/luci-app-store/luasrc/controller/store.lua

#3. Replace with JerryKuKu’s Argon
#rm openwrt/package/lean/luci-theme-argon -rf
