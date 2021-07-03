clear;
clc;

I1 = imread('L24.bmp');%读取左右图片
I2 = imread('R24.bmp');
%figure
%imshowpair(I1, I2, 'montage');
%title('Original Images');

%加载stereoParameters对象。
load('stereoParams.mat');%加载你保存的相机标定的mat

[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);
%figure
%imshowpair(J1, J2, 'montage');
%title('Undistorted Images');
imwrite(J1,'reL24.bmp');
imwrite(J2,'reR24.bmp');

im_Merge = [J1,J2];%拼接图像
figure,imshow(im_Merge);%展示图像
hold on
% 画水平线
for k = 1:28
    line([0 3908],[k*50 k*50],'color','g','LineWidth',1);
end
% imwrite(im_Merge,'im_Merge.jpg');%保存图像

 
 

