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

#echo CPU超频
echo "CONFIG_FIRMWARE_INCLUDE_OC=n" >> $config #CPU超频开关
echo 'CONFIG_FIRMWARE_MT7621_OC="0x312"' >> $config #此处填写对应频率的十六进制：1000Mhz=0x312 1100Mhz=0x362 1120Mhz=0x372 1200Mhz=0x3B2

##echo 科学上网##
sed -i "s/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y/g" $config
sed -i "s/CONFIG_FIRMWARE_INCLUDE_V2RAY=y/CONFIG_FIRMWARE_INCLUDE_V2RAY=y/g" $config

##echo 广告管理##
sed -i "s/CONFIG_FIRMWARE_INCLUDE_ADBYBY=y/CONFIG_FIRMWARE_INCLUDE_ADBYBY=y/g" $config

##echo DNS服务##
sed -i "s/CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y/CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y/g" $config

#  done
#fi
