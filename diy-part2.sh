#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.254/g' package/base-files/files/bin/config_generate
# Modify default Ver
# sed -i 's/R23.7.7/R23.7.7 Build By LawKim/g' package/lean/default-settings/files/zzz-default-settings

########### 更改默认主题（可选）###########
# 删除自定义源默认的 argon 主题
# rm -rf feeds/luci/themes/luci-theme-argon
# 拉取 argon 原作者的源码
git clone -b https://github.com/jerrykuku/luci-theme-argon.git feeds/luci/themes/luci-theme-argon
git clone -b https://github.com/kenzok78/luci-theme-design.git feeds/luci/themes/luci-theme-design
# 替换默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci-light/Makefile
sed -i 's/bootstrap/argon/g' feeds/luci/collections/luci-light/Makefile
