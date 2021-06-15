# 2-相机投影仪标定

## 1、前言 & 参考文献

相机投影仪标定本身就是一个很难的课题，本人也有很多疑问。一般来说，相机投影仪标定，可以将投影仪看成一个"逆向"的相机，就是这个"相机"投射什么图片，它采集到的就是什么图片。那么，相机投影仪标定就可以看作是一个双目标定的问题。我们知道，双目标定比较简单，Matlab就有现成的工具箱，双目标定可以标定出两个相机的内参以及它们之间的外参（两个相机坐标系之间的旋转矩阵和平移向量）。因此，相机投影仪标定同样是标定出相机和投影仪的内参，以及它们之间的外参。只不过Matlab没有现成的工具箱，各位道友也可以自己找一找解决方案。本文参考的是如下论文的方法：

[1] Moreno D, Taubin G. Simple, accurate, and robust projector-camera calibration[C]//2012 Second International Conference on 3D Imaging, Modeling, Processing, Visualization & Transmission. IEEE, 2012: 464-471. https://ieeexplore.ieee.org/abstract/document/6375029

## 2、相机投影仪标定步骤

### (1) 投射格雷码图案到棋盘格

本文采用的是格雷码结构光，格雷码图案如图所示，其中第1和第2张图案为全白和全黑图案，第3\~22共20张图案为纵向格雷码图案，第23\~42共20张图案为横向格雷码图案。(格雷码图案在[pattern](./pattern)目录下)

<div align="center">
<img src="https://cdn.jsdelivr.net/gh/ZengZhiK/PicBed/结构光&多视图三维重建/20210612014014.png" width="80%"/>
</div>
通过投射格雷码图案于棋盘格标定板，如图所示。然后需改变棋盘格的摆放位置3次以上，即拍摄3组以上图片，才能进行标定。(本文拍摄了4组图片，见目录[calib](./calib))

<div align="center">
<img src="https://cdn.jsdelivr.net/gh/ZengZhiK/PicBed/结构光&多视图三维重建/20210615234801.png" width="80%"/>
</div>

### (2)  根据算法计算出标定参数

根据论文提到的开源算法，得到标定参数如下 (详见[calibration.m](./calib/calibration.m))：

<div align="center">
<img src="https://cdn.jsdelivr.net/gh/ZengZhiK/PicBed/结构光&多视图三维重建/20210615235431.png" width="100%"/>
</div>

重投影误差＜0.1，标定结果非常好。