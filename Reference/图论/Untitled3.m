clc;
clear all;
I=imread('E:\����1\50\2.jpg');
I=imresize(I,[40 80]);
imwrite(I,'a.jpg')