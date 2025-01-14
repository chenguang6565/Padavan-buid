#####################################################################
# cd /opt/rt-n56u/trunk 执行在这个目录下
#
# 修改默认参数（不同设备拷贝到相应 *.sh)          by: chenguang
#####################################################################

user_name="admin"                                   # 用户名
user_password="admin"                               # 登录密码
lan_ip="192.168.6"                                  # LAN 地址 别写后面的 .1
wlan_2g_ssid="5201314"                              # 2G 无线名称
wlan_5g_ssid="52013145"                           # 5G 无线名称
wlan_2g_psk="chenguang6565"                            # 2G WIFI密码最少8位 空白为不设置
wlan_5g_psk="chenguang6565"                            # 5G WIFI密码最少8位 空白为不设置
version_time=$(date +%2022%6%26)                        # 更新时版本号时间: 20210101
default_file="./user/shared/defaults.h"             # 默认配置文件


echo "修改 LAN IP 地址"
sed -i "s/192.168.6/$lan_ip/g" $default_file

echo "修改 2G 无线名称"
sed -i 's/DEF_WLAN_2G_SSID	BOARD_PID "5201314"/DEF_WLAN_2G_SSID	"'$wlan_2g_ssid'"/g' $default_file

echo "修改 5G 无线名称"
sed -i 's/DEF_WLAN_5G_SSID	BOARD_PID "52013145"/DEF_WLAN_5G_SSID	"'$wlan_5g_ssid'"/g' $default_file

echo "修改 2.4GHz WIFI 密码"
sed -i 's/DEF_WLAN_2G_PSK		"chenguang6565"/DEF_WLAN_2G_PSK		"'$wlan_2g_psk'"/g' $default_file

echo "修改 5GHz WIFI 密码"
sed -i 's/DEF_WLAN_5G_PSK		"chenguang6565"/DEF_WLAN_5G_PSK		"'$wlan_5g_psk'"/g' $default_file

echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=.*/FIRMWARE_BUILDS_REV=$version_time/g" ./versions.inc
