---
layout: post
title: 搭建你的C开发环境
author: yangfch3
comments: true
date: 2016-06-01 15:31:22\
description: 本文主要介绍如何在各个主流的平台（Win、*nux、macOS）上搭建你的 C 开发环境
tags:
- C
- Tools/Skills
categories:
- C/C++
---

每当我们学习一门新的语言，开发环境的搭建便是最先遇到的一个问题，也是最先需要解决的一个问题。
<!-- more -->

## Linux

基本所有 Linux 的发行版都内置了 C 的[编译器](http://www.ruanyifeng.com/blog/2014/11/compiler.html)：`gcc`，你需要做的只有以下几点：

1. 检查你的 `gcc` 的版本确保其对最新的标准由良好的实现
2. 选择合适的编辑器或 IDE
   1. 如果是纯终端工作的话，请配置好你的 [`Vim`](http://www.vim.org/) 或 [`Emacs`](https://www.gnu.org/s/emacs/)，当然也可以是其他你喜欢的编辑器；
   2. 如果习惯在视窗环境下工作的话，选择一款合适的视窗编辑器或 IDE，如果对于选择毫无头绪，请 Google 之。
3. 检查你的 [`gdb`](http://blog.csdn.net/haoel/article/details/2879) 的版本，如有需要请更新到最新的稳定版
4. 学习 C，编译 C，[使用 `gdb` 调试你的程序](http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/gdb.html)
5. 更高阶一点，当你需要构建一些复杂的多模块的程序时，你需要 [学习 make 命令的用法](http://www.ruanyifeng.com/blog/2015/02/make.html)，学会[书写 `makefile` 文件](http://seisman.github.io/how-to-write-makefile/index.html)

以上清单适合初学者，其他工具与环境可以从 [链接](https://www.zhihu.com/question/19848310) 内寻找。

## Windows

Windows 下搭建 C 的开发环境思路与 Linux 大致接近，同样是从：编辑器、编译器、调试器等方面入手；与此同时，由于现代版 Windows 的视窗功能越来越强大，我们能够选择的 IDE 也越来越多，并且巨硬官方也有宇宙中数一数二的 VS 供开发者选择。

但是，我们需要知道的是，C 最先使用的地方是 Unix，在 Windows 下我们开发的过程中和在 Linux/Unix 下存在微小的差异。

### 使用 ST3 与 MinGW

在 Windows 下你同样可以使用 Vim，或者使用 Notepad++（但是不要选用 Windows 自带的 Notepad，存在 BOM 头的影响）。

如果你是一个前端，正好想一探 C 的世界的究竟，并且你对 Sublime 十分熟悉，那么你可以接着往下看了。

在 Sublime Text 3 **编辑器** 下，你需要安装的插件：

1. ST3 安装 AStyleFormatter：用于格式化、美化你的 C 代码
2. 安装 Cppcheck，并将其添加值 Path；ST3 安装 [Sublimelinter-cppcheck](http://www.yalewoo.com/cpp_sublimelinter.html)（前置条件：已安装 Sublimelinter）
3. 安装其他必要的插件：C 补全加强、ConvertToUtf-8...
4. 编写必要的常用的 C snippets

> sublimelinter-cppcheck 可以在保存的时候检查你代码可能出现的语法错误，而 cppcheck 也提供了命令行界面，十分友好。
>
> {% asset_img cppcheck.png cppcheck %}

然后是编译环境了：

1. 安装好 [MinGW](https://nuwen.net/mingw.html)，使得你的 Windows 也能实现大部分 GNU 工具集提供的功能，例如：gcc、gdb

2. 将 MinGW>>bin 路径加入系统的 Path

3. 然后你就可以在任何地方执行编译的过程了

   ```shell
   $ gcc tst.c -o tst
   ```

4. 同时在拥有了 MinGW 之后你就可以 [使用 `gdb` 调试你的程序](http://linuxtools-rst.readthedocs.io/zh_CN/latest/tool/gdb.html) 来调试你的程序了

5. 然后，在 Sublime 里新建 `Build System`，复制粘贴以下代码，存储为 `C.sublime-build`

   ```json
   {
       "working_dir": "$file_path",
       "cmd": "gcc -Wall \"$file_name\" -o \"$file_base_name\"",
       "file_regex": "^(..[^:]*):([0-9]+):?([0-9]+)?:? (.*)$",
       "selector": "source.c",
    
       "variants": 
       [
           {   
           "name": "Run",
               "shell_cmd": "gcc -Wall \"$file\" -o \"$file_base_name\" && start cmd /c \"\"${file_path}/${file_base_name}\" & pause\""
           }
       ]
   }
   ```

   在写完程序之后，`ctrl+b` 即可快速编译-运行，并会反馈报错信息

现在，你可以使用 Sublime 进行无缝的 编写-编译-执行-调试 了，你也可以使用上面提到的某个工具进行单独的某个步骤的操作。

我们看一下最终的效果：

{% asset_img all.png wordplace-shot %}

### 使用 VS

[链接：VS 起步 @M$](https://msdn.microsoft.com/zh-cn/library/ms165079.aspx)

[链接：C++ in VS @M$](https://msdn.microsoft.com/zh-cn/library/bb384847.aspx)

### 使用 IDE

[链接：Windows C IDE](https://www.google.com/webhp?sourceid=chrome-instant&ion=1&espv=2&ie=UTF-8#q=windows+C+IDE+%E7%9F%A5%E4%B9%8E)

[链接：C/C++ IDE @stack overflow](http://stackoverflow.com/questions/89275/best-c-ide-or-editor-for-windows)

[链接：C/C++ IDE @Quora](https://www.quora.com/What-is-the-best-C-C-IDE)

## OS X

[链接：OS X C IDE](https://www.google.com.hk/search?safe=strict&biw=1920&bih=960&noj=1&q=OS+X+C+IDE&oq=OS+X+C+IDE&gs_l=serp.3..0i10j0i5i30j0i8i30l4.180502.181407.0.182091.4.4.0.0.0.0.408.408.4-1.1.0....0...1c.1.64.serp..3.1.408.U5vYH_Bkc8o)

[链接：C/C++ IDE @stack overflow](http://stackoverflow.com/questions/1739517/good-c-ide-for-mac)

