#!/bin/bash
#=================================================
# 自定义
#=================================================
#1. 修改默认登录地址
sed -i 's/192.168.1.1/10.1.1.254/g' ./package/base-files/files/bin/config_generate

#2. 修改默认登录密码
sed -i 's/$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.//g' ./package/lean/default-settings/files/zzz-default-settings

#更换插件名称
#sed -i 's/ShadowSocksR Plus+/科学上网/g' ./package/feeds/small8/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/("iStore"),/("应用中心"),/g' ./package/feeds/small8/luci-app-store/luasrc/controller/store.lua

#修改内核版本
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.15/KERNEL_TESTING_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

#添加项目地址
sed -i '/<tr><td width="33%"><%:CPU usage (%)%><\/td><td id="cpuusage">-<\/td><\/tr>/a <tr><td width="33%"><%:云编译系统%><\/td><td><a href="https:\/\/github.com\/lmxslpc\/openwrt-build" target="_blank">GITHUB<\/a><\/td><\/tr>' ./package/lean/autocore/files/x86/index.htm

# 导入openclash核心
mkdir -p package/feeds/small8/luci-app-openclash/root/etc/openclash/core
cp ../customize/clash package/feeds/small8/luci-app-openclash/root/etc/openclash/core
cp ../customize/clash_meta package/feeds/small8/luci-app-openclash/root/etc/openclash/core
cp ../customize/clash_tun package/feeds/small8/luci-app-openclash/root/etc/openclash/core
wget -qO- https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat > package/feeds/small8/luci-app-openclash/root/etc/openclash/GeoIP.dat
wget -qO- https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat > package/feeds/small8/luci-app-openclash/root/etc/openclash/GeoSite.dat
chmod +x package/feeds/small8/luci-app-openclash/root/etc/openclash/core/clash*
