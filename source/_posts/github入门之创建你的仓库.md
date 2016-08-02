---
layout: post
title: github入门之创建你的仓库
author: lhhhq
comments: true
date: 2016-05-29 8:01:19
description: github是一款主流的git仓库在线托管服务提供商，本文将介绍github的一些基本用法。
tags:
- github
categories:
- 工具
---

git是一款用于版本管理的工具，作为一名设计师，如果会一点点html和css，还学会使用git，那么将给程序员减轻不少负担。github是一款主流的git仓库（待会解释仓库）在线托管服务提供商，以下介绍github的一些基本用法。

首先在github中申请一个账号，登陆后会见到以下界面：
![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201605/20160529202138773.png)
看到上图右上角有个绿色按钮：New repository（新建仓库）。我们就是通过建立一个个仓库来对版本进行存储（很形象有木有）。点击它我们来建一个仓库：
![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201605/20160529203105163.png)
于是我们就有了一个仓库，长这样：
![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201605/20160529203645602.png)
先不管这个界面的其他英文，我们只看右边第一个绿色的按钮：clone or download（克隆/下载），点击：
![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201605/20160529214032773.png)
上面被圈住那行代码的就是这个仓库的HTTPS地址，我们不直接在这下载这个仓库，就拷贝一下地址。
然后你需要一个工具：gitbash（篇幅有限不说明怎么安装了）。安装后，在桌面上右键，选择“gitbash”，进入以下界面：
![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201605/20160529204408799.png)
第一行代码显示了当前的位置，因为刚刚是在桌面gitbash，所以这里显示的位置是在桌面。
输入“git clone 刚刚复制的地址”，按下Enter，仓库就被下载下来了：
![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201605/20160529204942156.png)
（当然在浏览器上直接下载也是可以的，但是我们之后将会全程使用gitbash来进行所有git操作，而且这样也便捷一些，所以我们从clone开始认识这个工具）
打开“lhq001”，里面会有一个.git文件夹（就是它负责版本管理），以及这个仓库含有的文件，比如我这里就只有一个叫做“LICENSE”的文档：

![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201605/20160529205522174.png)
到了这一步，我们需要理解一个概念，就是本地仓库和远程仓库的关系。我们刚刚一开始在github上创建的就是一个远程仓库，它在github上，不在我们的电脑上，所以叫做远程。当我们把它下载到自己的电脑上，我们就有了一个本地仓库，如上图桌面上的那个文件夹所示。
这下就能够理解，为什么github是一个git在线服务提供商了。有了github我们不但能实现版本管理，还能上传至云端与他人共享自己的源代码。而这两点，都是非常有利于项目协同的。这大概就是为什么这么多人喜欢github的原因之一吧。

下篇预告：《github入门之“上推”你的仓库》