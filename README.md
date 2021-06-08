# 结构光 & 多视图三维重建

## 前言

本仓库维护我在研究生阶段所做的工作，发表的论文、专利的文档。

## 硬件部分

- <b><font color="#007bff">搭建结构光三维测量系统：</font></b>系统由一个DLP投影仪（型号：闻亭PRO6500）、一个单目相机（型号：FLIR BFS-U3-50S5）、一个旋转平台组成

<div align="center">
<img src="https://cdn.jsdelivr.net/gh/ZengZhiK/PicBed/结构光&多视图三维重建/20210608222940.png" width="60%"/>
</div>

- <b><font color="#007bff">实现了投影仪和相机的硬件同步</font></b>：当投影图片切换时，投影仪发送触发信号到相机，实现相机的自动拍摄，即投射一张图片、拍摄一张图片

## 软件部分

- <b><font color="#007bff">实现结构光三维重建算法</font></b>：采用的是**格雷码结构光**
  - 能够对投影仪和相机进行标定，获得投影仪和相机的内参以及它们之间的外参
  - 能够实现格雷码的解码算法，获得投影机像素和相机像素之间的映射关系
  - 最终根据三角原理，获得物体一个侧面的点云

<div align="center">
<img src="https://cdn.jsdelivr.net/gh/ZengZhiK/PicBed/结构光&多视图三维重建/20210608225000.png"/ width="80%">
</div>

- <b><font color="#007bff">实现多视图点云拼接算法</font></b>：采用的是**旋转平台**进行点云的拼接
  - 创新点：使用标定球对旋转平台进行标定，获得相机坐标系和旋转平台坐标系之间的关系
  - 利用预设的旋转角度完成点云的拼接，获得物体完整的点云

<div align="center">
<img src="https://cdn.jsdelivr.net/gh/ZengZhiK/PicBed/结构光&多视图三维重建/20210608225820.png" width="80%"/>
</div>

## 整体效果

<div align="center">
<img src="https://cdn.jsdelivr.net/gh/ZengZhiK/PicBed/结构光&多视图三维重建/20210608225940.png"/>
</div>

## 仓库结构

本仓库将分步骤说明如何实现（见各个目录）：

**1-硬件搭建&使用**  —— [link](./1-硬件搭建&使用)

**2-格雷码结构光 **    —— [link](./2-格雷码结构光)

**3-多视图点云拼接** —— [link](./3-多视图点云拼接)

## 结束语