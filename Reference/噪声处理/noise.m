%% ��ȡ����ͼ����������������� 30������
clc;
clear all;
% str1='C:\ѵ��3\';
str1='E:\test6\eye\';   %  ��
str2='.jpg';
str3='E:\����5\�ߵ�\'; %  ��
str4='E:\����5\����\';
str5='E:\����5\��˹\';
str6='E:\����5\����\';
Size=153;                     %  ��
for i=1:Size
    I=imread(strcat(str1,num2str(i),str2));
    I_speckle=imnoise(I,'speckle');
    imwrite(I_speckle,strcat(str3,num2str(i),str2)); %�ߵ�
    I_poisson=imnoise(I,'poisson');
    imwrite(I_poisson,strcat(str4,num2str(i),str2)); %����
    I_gaussian=imnoise(I,'gaussian');            
    imwrite(I_gaussian,strcat(str5,num2str(i),str2)); %��˹
    I_salt=imnoise(I,'salt & pepper'); 
    imwrite(I_salt,strcat(str6,num2str(i),str2));     %����
end