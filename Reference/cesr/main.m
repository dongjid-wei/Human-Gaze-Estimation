
%%

clc;
clear all;
num=36; %( 4 9 16 25 36)
numl=5; %( 1 2 3 4 5)
str1=strcat('E:\人眼',num2str(numl),'\eye',num2str(num),'\');
str2='.jpg';  % 训练样本的额数据集
b2=[];
w2=[];
for j=10:10:90
     str3=strcat('E:\人眼',num2str(numl),'\均匀');
    str4='.jpg';    %测试样本的数据集
    data=load(strcat('E:\人眼',num2str(numl),'\',num2str(num),'点.txt'));
    ture=load(strcat('E:\人眼',num2str(numl),'\','测试.txt'));
    fea=[];
    Size=num;
    %  获得训练样本的特征
    for i=1:Size
        I=imread(strcat(str1,num2str(i),str2));
        im = double(rgb2gray(I));
        im = imresize(im, [15, 30]);
        f=getfea(im);
        fea=[fea f];  %训练样本总特征
    end
    
    feature=fea;
    %%  测试样本 的特征
    
    feature1=[];
    for i=1:150
        I=imread(strcat(str3,num2str(j),'\',num2str(i),str4));
        f=getfea(double(I));
        feature1=[feature1 f];  %训练样本总特征
    end
    
    
    
    b1=[];
    sigma = 1.0;
    for i=1:150
        f=feature1(:,i);
        [w w1] = CESR(feature,f);
        
        cal=data'*w;
        erro=cal-ture(i,:)';
        a=sum(erro.^2,1);
        a=sqrt(a);
        c=atan(a.*0.027/50);
        b1=[b1 c];
    end
    %%
    b2=[b2 mean(b1)];
    w2=[w2 w];
end
save b2.mat b3;


