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
sed -i 's/192.168.1.1/192.168.1.252/g' package/base-files/files/bin/config_generate
# Modify default Ver
sed -i 's/R22.12.1/R22.12.1 Build By lawkim/g' /etc/openwrt_release
# Modify default Themes
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' lede/feeds/luci/collections/Makefile
sed -i 's/bootstrap/argon/g' lede/feeds/luci/collections/Makefile
cd lede/package/lean  
rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
