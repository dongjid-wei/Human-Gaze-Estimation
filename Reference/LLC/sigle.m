clc;
clear all;
num=36; %( 4 9 16 25 36)


str2='.jpg';  % ѵ�������Ķ����ݼ�
b26=[];
for numl=1:1:5   
    str1=strcat('E:\test',num2str(numl),'\eye',num2str(num),'\');
    str3=strcat('E:\test',num2str(numl),'\eye');
    str4='.jpg';    %�������������ݼ�
    data=load(strcat('E:\test',num2str(numl),'\',num2str(num),'��.txt'));
    ture=load(strcat('E:\test',num2str(numl),'\','����.txt'));
    fea=[];
    Size=num;
    %  ���ѵ������������
    for i=1:Size
        I=imread(strcat(str1,num2str(i),str2));
        im = double(rgb2gray(I));
        im = imresize(im, [15, 30]);
        f=getfea(im);
        fea=[fea f];  %ѵ������������
    end
    
    feature=fea';
    %%  �������� ������
    
    feature1=[];
    for i=1:150
        I=imread(strcat(str3,'\',num2str(i),str4));
       im = double(rgb2gray(I));
        im = imresize(im, [15, 30]);
        f=getfea(im);
        feature1=[feature1 f];  %ѵ������������
    end
    
    %%  ����ע�ӵ�Ƕȵ����
    b1=[];
    K=num;
    sigma = 100.0;
    beta=8;
    for i=1:150
        f=feature1(:,i);
        W = SimilarityMatrix( feature' , f , sigma ) ;  %��w  ֮��ľ����ϵ
        C=(feature-repmat(f',num,1))*(feature-repmat(f',num,1))';
        %     beta=1/(ones(K,1)'*pinv(C)*ones(K,1));
        w=(C+eye(K,K)*beta*diag(W))\ones(K,1);
        cal=data'*w;
        erro=cal-ture(i,:)';
        a=sum(erro.^2,1);
        a=sqrt(a);
        c=atan(a.*0.027/50);
        b1=[b1 c];
    end
    b26=[b26 mean(b1)];
end
% save b25.mat b25;
bb=sum(b26)/5;
save bb.mat bb;
% b=(b21+b22+b23+b24+b25)/5;