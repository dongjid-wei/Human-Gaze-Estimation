clc;
clear all;
path(path, './Optimization');
num=25;
str1=strcat('E:\test5\eye',num2str(num),'\');
str2='.jpg';
fea=[];
Size=num;
flong=3;
for i=1:Size
    I=imread(strcat(str1,num2str(i),str2));
   
    im = imresize(I, [40, 80]);
    imshow(im);
    f=getfea(im);
    fea=[fea f];  %ѵ������������
end
[COEFF, SCORE,latent] = princomp(fea');
% % L=fea'*fea;
% % [v d]=eig(L);
feature=fea'*COEFF(:,1:flong);  % ѵ������
c =randint(1,36,6)+1;
% c=feature(:,3)+1;
scatter3(feature(:,1),feature(:,2),feature(:,3),10);
caxis([1,5]);
