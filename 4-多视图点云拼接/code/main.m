% ==================================================================================
% 作        者：曾智康
% 日        期：2021-7-7 23:42:38
% 版        本：v1.0
% 项目描述：
%         本项目实现多视图点云拼接
%         - 输入：data文件夹下某物体12个角度的点云数据（每次旋转角度为30°）
%         - 输出：粗配准后的点云数据
%         - 具体步骤：
%             (1) 输入12组点云数据
%             (2) 根据标定球中心，将点云数据从相机坐标系平移到旋转平台坐标系
%             (3) 根据旋转角度逆向旋转，完成点云的粗配准
%             (4) 输出12组粗配准后的点云数据
%
% 软件平台：MATLAB R2018b+版本才可运行
%
% 硬件设备：PRO6500投影仪+灰点相机+旋转平台
%
% 参考文献：无（自己想的方法）
%
% 运行:
%     - 直接点击即可运行
%     - 更换数据需在data目录下建立文件夹，将点云数据放入，并在result目录下建立同名文件夹
% ==================================================================================
clc, clear, close all

% ========1、输入12组点云数据======================================================
dataPath = './data/';                             % 数据文件夹为当前路径下的data目录
object = 'house1/';                            % 子目录为data文件夹下的house1文件夹
objectPath = strcat(dataPath, object);            % 路径拼接
addpath(genpath(dataPath));                       % 加入MATLAB路径
objectFile = dir(fullfile(objectPath, '*.ply'));  % 点云格式为ply格式
objectFileNames = {objectFile.name}               % 输出文件名

% ========2、根据标定球中心，将点云数据从相机坐标系平移到旋转平台坐标系================
% ========3、根据旋转角度逆向旋转，完成点云的粗配准==================================
% ========4、输出12组粗配准后的点云数据=============================================
center = [7.4785, -21.1053, 358.0625];            % 标定球中心坐标

for i = 1:12
   filename = objectFileNames{i};
   ptCloud = pcread( filename );
   xyz = ptCloud.Location;
   
   % 将点云数据从相机坐标系平移到旋转平台坐标系
   newXYZ = xyz - center;
   
   % 根据旋转角度逆向旋转，完成点云的粗配准
   R = [cos(-pi*(i-1)/6) 0 sin(-pi*(i-1)/6);
        0          1          0;
        -sin(-pi*(i-1)/6), 0, cos(-pi*(i-1)/6)];
   newXYZ = newXYZ';
   newXYZ = R * newXYZ;
   newXYZ = newXYZ';

   % 保存点云为ply格式
   newPtCloud = pointCloud(newXYZ);
   pcwrite(newPtCloud, ['./result/' object, 'cr', filename(end-5:end)], 'PLYFormat', 'ascii');
end
