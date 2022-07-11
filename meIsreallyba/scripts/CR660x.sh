#####################################################################
# 修改默认参数
#####################################################################

lan_ip="192.168.6"                          # LAN 地址 别写后面的 .1
default_path="./user/shared"                # 默认配置路径
config="./configs/templates/CR660x.config"     # 默认配置文件


#echo "设置为PPPOE模式并写入账号和密码"
sed -i 's/{ "wan_proto", "dhcp" }/{ "wan_proto", "pppoe" }/g' $default_path/defaults.c
sed -i 's/{ "wan_pppoe_username", "" }/{ "wan_pppoe_username", "15936672877" }/g' $default_path/defaults.c
sed -i 's/{ "wan_pppoe_passwd", "" }/{ "wan_pppoe_passwd", "672877" }/g' $default_path/defaults.c
#echo "设置为 AP模式"
#echo "#define BOARD_ROLE_REPEATER	1" >> ./configs/boards/K2P/board.h

#echo "打开2G无线桥接"
#sed -i 's/{ "rt_mode_x", "0" }/{ "rt_mode_x", "4" }/g' $default_path/defaults.c

#echo "打开5G无线桥接"
#sed -i 's/{ "wl_mode_x", "0" }/{ "wl_mode_x", "4" }/g' $default_path/defaults.c

#CPU超频
echo "CONFIG_FIRMWARE_INCLUDE_OC=y" >> $config #CPU超频开关
echo 'CONFIG_FIRMWARE_MT7621_OC="0x312"' >> $config #此处填写对应频率的十六进制：1000Mhz=0x312 1100Mhz=0x362 1120Mhz=0x372 1200Mhz=0x3B2

#echo "集成科学插件"
grep "CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y" $config
if [ $? -eq 0 ]; then
  for MOD in SHADOWSOCKS XRAY TROJAN SSOBFS IPSET EAP_PEAP OPENSSH OPENSSL_EC OPENSSL_EXE CURL; do
    sed -i "s/CONFIG_FIRMWARE_INCLUDE_${MOD}=n/CONFIG_FIRMWARE_INCLUDE_${MOD}=y/g" $config
    
##广告管理##
echo "CONFIG_FIRMWARE_INCLUDE_ADBYBY=y" >> $.config #adbyby plus+

 ##DNS服务##
echo "CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y" >> $.config #smartdns
#  done
#fi
