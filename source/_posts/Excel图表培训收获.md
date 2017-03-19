---
layout: post
title: Excel图表培训收获
author: lhhhq
comments: true
date: 2015-08-22 15:02:06
description: 了解Excel的一些使用常识，学学用ppt做吊炸天的图表！
tags:
- office
categories:
- 学习笔记
---

**一、Excel**

1. 文字在左，数字在右。
2. @代表文本占位符，控制文本重复的次数。
3. 0代表数字占位符，控制录入内容数字显示的位数。
4. [颜色]改变单元格内容的颜色。
5. 正数;负数;0;文本。

**二、图表的简化**

1. 去除背景
2. 去除元素
3. 去除效果
4. 去除字体
5. 去除颜色

案例：

![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822153312319.png)

↓↓↓

![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822153312444.png)

**三、复制粘贴的妙用**

1. 填充-伸展/层叠/层叠并缩放
   伸展：
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822160117324.png)
   层叠：
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822154953513.png)
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822154953606.png)
   层叠并缩放：
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822155140030.png)
2. 系列层叠，不同系列的数据才可层叠；分类间距，控制系列内各项（类别）的间距
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822155442628.jpg)
3. 条形图高度（各项数值）的差异将导致粘贴的图案形状产生差异，这样的不规则有时也是一种创意
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822154616797.png)
4. 若要保持形状不变，首先新建两个系列，其中一个系列内各项设置为一个固定值（柱顶），另外一个系列则由原系列各项值减去这个固定值所得（柱身）；然后更改图表类型为堆积柱形图，将系列层叠值设至最大（100%）；最后运用复制粘贴，用自定义图案替换掉柱顶即可
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822160825046.jpg)
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822160835779.png)
   利用无颜色与有颜色形状之间组合可以做出更丰富的效果：
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822162158416.jpg)
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822162233532.png)
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822181931921.jpg)
   要注意的是，由于复制粘贴之后图案无法再进行编辑（如大小、颜色的控制），因此需在复制粘贴前把图案编辑好。

**四、复合图表的应用**（只说**条形图**和**散点图**的结合）

步骤：

1. 打开选择数据对话框，添加一个系列，然后将这个系列转换为散点图，如图（1）~（6）所示。
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822164709653.jpg)
   （1）
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822164721993.jpg)
   （2）
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822164729668.jpg)
   （3）
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822164743053.jpg)
   （4）
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822164754316.jpg)
   （5）
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822164809697.jpg)
   （6）
2. 回到选择数据对话框，点击编辑，依据原条形图的数据的情况来填写x轴和y轴系列值，在这里x代表原图中的项目进度（即45%），y根据纵轴的最大值来确定，使该点在位于垂直线上的中点即可（这里纵轴最大值为1，因此y填0.5），如图（7）~（9）所示。
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822164821725.jpg)
   （7）
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822170507896.jpg)
   （8）
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822165211420.jpg)
   （9）
3. 最后把图案调整成合适大小复制粘贴到该点即可，如图（10）。
   ![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/jpg/201508/20150822165043873.jpg)
   （10）

以上是基本原理和流程，据此还可以做出更多（看起来）高大上更富设计性的图表，超赞的有木有~

![img](http://ce.sysu.edu.cn/hope/UploadFiles/image/png/201508/20150822165323632.png)