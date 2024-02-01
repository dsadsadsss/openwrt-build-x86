#!/bin/bash
#=================================================
# 自定义
#=================================================
# 修改默认登录地址
sed -i 's/192.168.1.1/10.1.1.254/g' ./package/base-files/files/bin/config_generate

# 修改默认登录密码
#sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' ./package/base-files/files/etc/shadow

# 更换插件名称
#sed -i 's/ShadowSocksR Plus+/科学上网/g' ./package/feeds/small8/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua
sed -i 's/("iStore"),/("应用中心"),/g' ./package/feeds/small8/luci-app-store/luasrc/controller/store.lua

# 修改内核版本
#sed -i 's/KERNEL_PATCHVER:=6.1/KERNEL_PATCHVER:=5.15/g' ./target/linux/x86/Makefile
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.15/KERNEL_TESTING_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# TTYD 免登录
sed -i 's|/bin/login|/bin/login -f root|g' feeds/packages/utils/ttyd/files/ttyd.config

# 替换luci-theme-design
# rm -rf package/feeds/small8/luci-theme-design && git clone -b js --single-branch https://github.com/gngpp/luci-theme-design package/feeds/small8/luci-theme-design

# 修复插件冲突
#mosdns
rm -rf feeds/small8/luci-app-mosdns/root/etc/init.d

#添加项目地址
sed -i 's/cpuusage\.cpuusage/cpuusage.cpuusage,/g' feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
sed -i -f ../customize/diy/status.sed feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js

# 修改 Makefile
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/luci.mk/$(TOPDIR)\/feeds\/luci\/luci.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/..\/..\/lang\/golang\/golang-package.mk/$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang-package.mk/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHREPO/PKG_SOURCE_URL:=https:\/\/github.com/g' {}
# find package/*/ -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/PKG_SOURCE_URL:=@GHCODELOAD/PKG_SOURCE_URL:=https:\/\/codeload.github.com/g' {}

#替换 luci-app-netdata
#rm -rf feeds/luci/applications/luci-app-netdata
#git clone --depth=1 https://github.com/Jason6111/luci-app-netdata feeds/luci/applications/luci-app-netdata

# 调整 netdata 到 服务 菜单
#sed -i 's/"system"/"services"/g' feeds/luci/applications/luci-app-netdata/luasrc/controller/*.lua
#sed -i 's/"system"/"services"/g' feeds/luci/applications/luci-app-netdata/luasrc/model/cgi/*.lua
#sed -i 's/admin\/system/admin\/services/g' feeds/luci/applications/luci-app-netdata/luasrc/view/netdata/*.htm


#修改默认设置
cp -f ../customize/diy/default-settings package/emortal/default-settings/files/99-default-settings

./scripts/feeds install -a
