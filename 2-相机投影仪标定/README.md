# 2-相机投影仪标定

## 1、前言 & 参考文献

相机投影仪标定本身就是一个很难的课题，本人也有很多疑问。一般来说，相机投影仪标定，可以将投影仪看成一个"逆向"的相机，就是这个"相机"投射什么图片，它采集到的就是什么图片。那么，相机投影仪标定就可以看作是一个双目标定的问题。我们知道，双目标定比较简单，Matlab就有现成的工具箱，双目标定可以标定出两个相机的内参以及它们之间的外参（两个相机坐标系之间的旋转矩阵和平移向量）。因此，相机投影仪标定同样是标定出相机和投影仪的内参，以及它们之间的外参。只不过Matlab没有现成的工具箱，各位道友也可以自己找一找解决方案。本文参考的是如下论文的方法：

[1] Moreno D, Taubin G. Simple, accurate, and robust projector-camera calibration[C]//2012 Second International Conference on 3D Imaging, Modeling, Processing, Visualization & Transmission. IEEE, 2012: 464-471. https://ieeexplore.ieee.org/abstract/document/6375029