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

# TTYD 免登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

#添加项目地址
sed -i '/<tr><td width="33%"><%:CPU usage (%)%><\/td><td id="cpuusage">-<\/td><\/tr>/a <tr><td width="33%"><%:Github项目%><\/td><td><a href="https:\/\/github.com\/lmxslpc\/openwrt-build" target="_blank">云编译系统<\/a><\/td><\/tr>' ./package/lean/autocore/files/x86/index.htm

# 修改本地时间格式
sed -i 's/os.date()/os.date("%a %Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改 Makefile
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version} by Linpc/g" package/lean/default-settings/files/zzz-default-settings

#替换 luci-app-netdata
rm -rf feeds/luci/applications/luci-app-netdata feeds/small8/luci-app-netdata
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata feeds/luci/applications/luci-app-netdata
sed -i 's/"status"/"system"/g' feeds/luci/applications/luci-app-netdata/luasrc/controller/*.lua
sed -i 's/"status"/"system"/g' feeds/luci/applications/luci-app-netdata/luasrc/model/cgi/*.lua
sed -i 's/admin\/status/admin\/system/g' feeds/luci/applications/luci-app-netdata/luasrc/view/netdata/*.htm



./scripts/feeds install -a
