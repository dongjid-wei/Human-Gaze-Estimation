
%%

clc;
clear all;
num=36;
str1=strcat('E:\����5\eye',num2str(num),'\');
str2='.jpg';
data=load(strcat('E:\����5\',num2str(num),'��.txt'));
ture=load('E:\����5\����.txt');
str3='E:\����5\��˹\';     %�ĵĵط�
str4='.jpg';
fea=[];
Size=num;
flong=100;
for i=1:Size
    I=imread(strcat(str1,num2str(i),str2));
    im = rgb2gray(I);
    im = imresize(im, [40, 80]);
    f=HPOG(im, 10, 10, 4, 4, 9, 0.5,'localinterpolate', 'unsigned', 'l2hys');
    fea=[fea f'];  %ѵ������������
end
[COEFF, SCORE,latent] = princomp(fea');
% L=fea'*fea;
% [v d]=eig(L);
feature=fea'*COEFF(:,1:flong);  % ѵ������

%%  ��������

feature1=[];
for i=1:150
    I=imread(strcat(str3,num2str(i),str4));
    im = rgb2gray(I);
    im = imresize(im, [40, 80]);
    f=HPOG(im, 10, 10, 4, 4, 9, 0.5,'localinterpolate', 'unsigned', 'l2hys');
    f=f*COEFF(:,1:flong);
    feature1=[feature1 f'];  %ѵ������������
end
b1=[];
sigma = 1.0;
for i=1:150
    f=feature1(:,i);
     [w w1] = CESR(feature',f);
%     W = SimilarityMatrix( feature' , f , sigma ) ;  %��w  ֮��ľ����ϵ
%     [w] = WCESR(feature',f,W);
    cal=data'*w;     
    erro=cal-ture(i,:)';   
    a=sum(erro.^2,1);
    a=sqrt(a);
    c=atan(a.*0.027/50);
    b1=[b1 c];    
end
%%
mean(b1)
std(b1)



