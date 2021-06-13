clear;
clc;

I1 = imread('L0031.BMP');%读取左右图片
I2 = imread('R0031.BMP');
figure
imshowpair(I1, I2, 'montage');
title('Original Images');

%加载stereoParameters对象。
load('stereoParams.mat');%加载你保存的相机标定的mat

[J1, J2] = rectifyStereoImages(I1, I2, stereoParams);
figure
imshowpair(J1, J2, 'montage');
title('Undistorted Images');
imwrite(J1,'reL.bmp');
imwrite(J2,'reR.bmp');

