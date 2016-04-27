#!/bin/sh

#自动翻墙脚本，配合shadowsocks-libev的ss-redir使用。需要ipset
#TODO 整合ss-redir命令和chinadns命令
#把链名写成变量
#打包成deb包，依赖于ipset，和iptables的包

#一键编译安装脚本，shadowsocks-libev和chinadns从源码安装，避免被墙
#github的repo链接两个项目
#检测apt-get，yum，pacman，若不可用则从源码安装iptables和ipset

#README.md带中文说明
#保证默认状态下为ACCEPT
#安卓也能用

chnroute_file=~/.chnroute
ignore_ips=(
	45.127.93.239
	0.0.0.0/8
	10.0.0.0/8
	127.0.0.0/8
	169.254.0.0/16
	172.16.0.0/12
	192.168.0.0/16
	224.0.0.0/4
	240.0.0.0/4
)
local_port=1080

update(){
  curl 'http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest' | grep ipv4 | grep CN | awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' > $chnroute_file
  echo "127.0.0.1/24" >> $chnroute_file
}

if [[ -r $chnroute_file ]]; then
  current=`date +%s`
  last_modified=`stat -c "%Y" $chnroute_file`
  if [[ $(($current-$last_modified)) -gt 604800 ]]; then
    if ping -q -c 1 -W 1 ftp.apnic.net >/dev/null; then
      update
    fi
  fi
else
  update
fi

start_rule(){
	sudo iptables -t nat -C OUTPUT -p tcp -j SHADOWTABLES >& /dev/null \
		|| sudo iptables -t nat -A OUTPUT -p tcp -j SHADOWTABLES
}

stop_rule(){
	sudo iptables -t nat -C OUTPUT -p tcp -j SHADOWTABLES >& /dev/null \
		&& sudo iptables -t nat -D OUTPUT -p tcp -j SHADOWTABLES
}

add_tables(){

	sudo iptables -t nat -N SHADOWTABLES >& /dev/null

	for ip in ${ignore_ips[@]} ;do
		sudo iptables -t nat -C SHADOWTABLES -d $ip -j RETURN \
			|| sudo iptables -t nat -A SHADOWTABLES -d $ip -j RETURN
	done

	sudo ipset create chnroute hash:net -exist
	cat $chnroute_file | sudo xargs -I ip ipset add chnroute ip -exist

	sudo iptables -t nat -C SHADOWTABLES -m set --match-set chnroute dst -j RETURN \
		|| sudo iptables -t nat -A SHADOWTABLES -m set --match-set chnroute dst -j RETURN

	sudo iptables -t nat -C SHADOWTABLES -p tcp -j REDIRECT --to-ports $local_port \
		|| sudo iptables -t nat -A SHADOWTABLES -p tcp -j REDIRECT --to-ports $local_port

}


case $1 in

	stop)
		stop_rule
		;;

	start|*)
		add_tables
		start_rule
		;;

	apply)
		start_rule
		;;

	add_rule)
		add_tables
		;;

esac
