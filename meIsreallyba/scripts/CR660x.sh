修改默认参数
3
#####################################################################
4
​
5
lan_ip="192.168.6"                          # LAN 地址 别写后面的 .1
6
default_path="./user/shared"                # 默认配置路径
7
config="./configs/templates/CR660x.config"     # 默认配置文件
8
​
9
​
10
#echo "设置为PPPOE模式并写入账号和密码"
11
sed -i 's/{ "wan_proto", "dhcp" }/{ "wan_proto", "pppoe" }/g' $default_path/defaults.c
12
sed -i 's/{ "wan_pppoe_username", "" }/{ "wan_pppoe_username", "15936672877" }/g' $default_path/defaults.c
13
sed -i 's/{ "wan_pppoe_passwd", "" }/{ "wan_pppoe_passwd", "672877" }/g' $default_path/defaults.c

#echo CPU超频
echo "CONFIG_FIRMWARE_INCLUDE_OC=n" >> $config #CPU超频开关
echo 'CONFIG_FIRMWARE_MT7621_OC="0x312"' >> $config #此处填写对应频率的十六进制：1000Mhz=0x312 1100Mhz=0x362 1120Mhz=0x372 1200Mhz=0x3B2

14
#echo "设置为 AP模式"
15
#echo "#define BOARD_ROLE_REPEATER  1" >> ./configs/boards/K2P/board.h
16
​
17
#echo "打开2G无线桥接"
18
#sed -i 's/{ "rt_mode_x", "0" }/{ "rt_mode_x", "4" }/g' $default_path/defaults.c
19
​
20
#echo "打开5G无线桥接"
21
#sed -i 's/{ "wl_mode_x", "0" }/{ "wl_mode_x", "4" }/g' $default_path/defaults.c
22
​
23
##echo 科学上网##
24
sed -i "s/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS=y/g" $config
25
sed -i "s/CONFIG_FIRMWARE_INCLUDE_V2RAY=y/CONFIG_FIRMWARE_INCLUDE_V2RAY=y/g" $config
26
​
27
##echo 广告管理##
28
sed -i "s/CONFIG_FIRMWARE_INCLUDE_ADBYBY=y/CONFIG_FIRMWARE_INCLUDE_ADBYBY=y/g" $config
29
​
30
##echo DNS服务##
31
sed -i "s/CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y/CONFIG_FIRMWARE_INCLUDE_SMARTDNS=y/g" $config
32
​
33
​
34
​
35
​
36
#  done
37
#fi
38
​
