---
layout: post
title: VMWare 搭配 XShell 实现远程环境的搭建
author: yangfch3
comments: true
date: 2016-06-04 21:03:50
description: 本文主要介绍如何使用 VMWare 搭建你的 Linux，以及实现基本的后端环境
tags:
- Linux
- Tools/Skills
- Shell
categories:
- Linux
---

在实际的开发过程中，一般的流程是先在本地开发完毕，然后远程到服务器上线。对于 Windows Server 环境，我们直接使用 Windows 提供给我们的 Remote 工具即可方便地服务器进行可视化操作，对于 Linux 情况就有些不同了。

平时我们自己接触到 Linux 服务器的机会较少，更是缺少针对 Linux 远程操作的经验，我们需要找寻一些工具与方法为我们提供 Linux 远程操作与开发的环境。而这，也是本文出现的目的。
<!-- more -->

本文的主要内容：

1. 利用 VMWare 搭建 Debian 和 CentOS 虚拟机；
2. 为 Debian 和 CentOS 搭建好 C/C++ 开发环境；
3. 利用 VMWare 的 NAT 模式及端口转发实现本地端口与远程端口之间的映射，从而使得我们的 Debian 和 CentOS 进化为真正的服务器（可以提供一般服务器的 HTTP 服务、SSH 服务等）；
4. 介绍使用 XShell 进行远程开发与操作的方法。

## 工具介绍

1. VMware® Workstation 12 Pro
2. XShell 5
3. Debian 安装镜像
4. CentOS 安装镜像
5. 一个能用来 Google 的梯子

## 利用 VMWare 安装 Debian 和 CentOS

只是工具使用层面的问题，基本没有技术难度。

[链接：Debian 镜像文件 torrent 下载](http://cdimage.debian.org/debian-cd/8.4.0/i386/bt-cd/)

[链接：CentOS everything-iso 下载](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Everything-1511.iso)

## 为我们 Linux 虚拟机搭建 C/C++ 开发环境

首先我们使用到的很多操作都是需要用到管理员权限的，所以首先我们需要将当前用户加入到 `sudoers` 列表中，我们才能在之后的操作中执行 `sudo` 类的命令。

{% asset_img install-gcc.png 更改sudoers列表 %}

{% asset_img visudo.png 新增一行 %}

首先我们需要进行 gcc、gdb 的检测或版本更新。

```shell
# 检测 gcc 是否已安装及其版本
gcc -v

# 如果需要安装
sudo apt-get install gcc gdb

# 查看 apt-get 的其他功能
apt-get -h
```

在安装的过程中极有可能会遇到一个问题：安装源的问题

```shell
sudo vi /etc/apt/sources.list
```

在这里我们可以将安装来源列表中有关 CD 介质的那一句去掉，进一步的我们也可以更改 `apt-get` 包的安装镜像源。

然后是安装我们熟悉 Vim 和 ST3。

Vim 的安装直接使用 `apt-get` 即可，ST3 的安装的话也比较简单，因为 ST 的作者早就为我们准备好了 `deb` 安装包。你只需要将下面的链接的版本号与架构（下载 Debian 镜像时选择的架构）调整为对应的参数就行了。

```
https://download.sublimetext.com/sublime-text_build-<version_number>_<arch>.deb
```

然后我们使用 `dpkg` 进行 deb 包的安装

```shell
sudo dpkg -i <sublime_text_3>
```

这样我们的 ST3 也就安装好了。

然后是 `cppcheck` 的安装。先到 [下载链接](https://sourceforge.net/projects/cppcheck/) 处下载 tar 包，然后我们先后执行以下命令：

```shell
# 解压缩，如果格式不被 tar 命令支持的话，直接双击后提取
tar xzvf cppcheck-1.7.3.tar.gz

cd cppcheck-1.7.3

# 不使用下面的方法的话安装会失败
sudo make SRCDIR=build CFGDIR=/usr/share/cppcheck/
sudo make install CFGDIR=/usr/share/cppcheck/
```

然后是为你的 ST 创建 `Build-System` 和各个插件：

```json
// 新建 build-system 将下面的配置复制保存为 C.sublime-build

{
    "working_dir": "$file_path",
    "cmd": "gcc -Wall \"$file_name\" -o \"$file_base_name\"",
    "file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$",
    "selector": "source.c",
    "shell": true,
 
    "variants": 
    [
        {   
        "name": "Run",
            "shell_cmd": "gcc -Wall \"$file\" -o \"$file_base_name\" && ./\"$file_base_name\""
        }
    ]
}
```

最迫切的是安装 `sublimelinter` 和 `sublimelinter-cppcheck` 进行 C/C++ 代码的语法检查。

当然，安装 IDE 也是可以的，你完全可以安装一个顺手的 IDE，新手需要了解 C 的预处理、链接、编译、输出几个过程的话推荐还是使用命令行。

## 将你的 Linux 变为可以 SSH 连接的服务器

{% asset_img VMWare-Net.png VMWare虚拟网卡 %}

在安装好 VMWare 后，我们会新增两块虚拟网卡。VMNet1 是为仅主机模式使用的，VMNet8 是为 NAT 模式使用的。

我们安装虚拟机时默认使用的网络连接方式就是 NAT 模式，我们需要进行如下设置：VMWare>>编辑>>虚拟网络设置。

{% asset_img NAT01.png NAT设置 %}

将我们的物理机的某个端口映射到 Linux 主机的 SSH 服务端口（当然你也可以对 Linux 虚拟主机的 80 端口进行映射，这样虚拟主机便能对外提供网络服务了）。

{% asset_img NAT02.png 端口映射 %}

然后我们需要为 Linux 虚拟机固定一个 DHCP IP 防止每次 Linux 主机的 IP 发生变化。网管等参数参见上面的 NAT 设置：

{% asset_img cont-ip.png 为Linux主机固定一个IP %}

一般我们的 Linux 虚拟主机的 SSH 服务是随机启动的，如果没有，请 Google 如何使 SSH 服务随机启动。

## 使用 XShell 愉快的工作

下面我们就可以使用 XShell 愉快的工作了。

{% asset_img XShell.png XShell启动界面 %}

然后我们只需要向我们物理机的特定端口发起 SSH 连接便可以连接到 Linux 虚拟机了。

XShell 最吸引人的两大特性：

1. 文件上传可以直接拖拽上传；
2. 对学生和家庭用户免费。

至此，我们整个远程环境就搭建好了，到现在，你已经拥有了一台真正能对外提供服务的 Linux 主机了。

## 小结

整个过程的原理十分简单，巧妙一点点的地方无非就是固定 Liunx 虚拟机的 IP 以及将本机 IP 端口对 Linux 虚拟机的特定端口做映射。

现在，让我们愉快地使用 XShell 和 VMWare 体验一把远程工作的快感吧！

## 友情链接

[XShell Facebook Page](https://www.facebook.com/netsarang )
[XShell 购买链接](https://www.netsarang.com/products/xsh_overview.html)
[VMWare Home](http://store.vmware.com/store/vmware/zh_CN/home)
[sublime 购买链接](https://www.sublimetext.com/buy)