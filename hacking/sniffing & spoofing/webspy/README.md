## 用法
```
./xsec_webspy
NAME:
   xsec webspy - xsec webspy, Support local and arp spoof modes

USAGE:
   xsec_webspy [global options] command [command options] [arguments...]

VERSION:
   20171214

AUTHOR(S):
   netxfly <x@xsec.io>

COMMANDS:
     start    sniff local server
     help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --mode value, -m value     webspy running mode, local or arp (default: "local")
   --device value, -i value   device name (default: "eth0")
   --host value, -H value     web server listen address (default: "127.0.0.1")
   --port value, -p value     web server listen address (default: 4000)
   --debug, -d                debug mode
   --target value, -t value   target ip address
   --gateway value, -g value  gateway ip address
   --filter value, -f value   setting filters
   --length value, -l value   setting snapshot Length (default: 1024)
   --help, -h                 show help
   --version, -v              print the version
```

支持sniff本地和以arp spoof的方式sniff同一lan中其他主机的http请求，并打开一个web server实时显示数据请求内容。

在启动前需要安装libpcap库并将内核参数设为允许转发，以下为3种OS的安装、设置方法：

```bash
# OSX
sudo sysctl net.inet.ip.forwarding=1

# FreeBSD
sudo sysctl -w net.inet.ip.forwarding=1

# Linux
sudo sysctl -w net.ipv4.ip_forward=1

# Fedora
sudo dnf install -y libpcap-devel

# Debian/Ubuntu
sudo apt-get install -y libpcap-dev

# OSX
brew install libpcap

# FreeBSD
sudo pkg install libpcap
```

需要指定采集的目标与网关，其中采集的目标的语法与nmap的一致，支持以下几种写法：

```shell
10.0.0.1
10.0.0.0/24
10.0.0.*
10.0.0.1-10
10.0.0.1, 10.0.0.5-10, 192.168.1.*, 192.168.10.0/24
```

命令语法分别如下：

1. `sudo ./xsec_webspy start -m local -i en0`
1. `sudo ./xsec_webspy start -m arp -i en0 -t 192.168.100.100 -g 192.168.100.1`  
