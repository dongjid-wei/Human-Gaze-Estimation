
%%

clc;
clear all;
num=36; %( 4 9 16 25 36)
numl=1; %( 1 2 3 4 5)
str1=strcat('E:\����',num2str(numl),'\eye',num2str(num),'\');
str2='.jpg';  % ѵ�������Ķ����ݼ�
b36=[];
for j=10:10:90
    str3=strcat('E:\����',num2str(numl),'\����');
    str4='.jpg';    %�������������ݼ�
    data=load(strcat('E:\����',num2str(numl),'\',num2str(num),'��.txt'));
    ture=load(strcat('E:\����',num2str(numl),'\','����.txt'));
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
    
    feature=fea;
    A=fea;
    %%  �������� ������
    
    feature1=[];
    for i=1:150
        I=imread(strcat(str3,num2str(j),'\',num2str(i),str4));
        f=getfea(double(I));
        feature1=[feature1 f];  %ѵ������������
    end
    
    %%  ����ע�ӵ�Ƕȵ����
    b1=[];
    sigma = 1.5;
    lamda=0.01;
    lambda1=0.005;
    sigma = 100;
    for i=1:150
        f=feature1(:,i);
        y=f;
%                 D = sqrt(sum((A - repmat(y, 1, num)).^2,1))';
%       d = exp(D/sigma);
        d=SimilarityMatrix( feature, f , sigma ) ;  %��w  ֮��ľ����ϵ
        [w] = WCRFS(feature',f,lamda,d,lambda1);

%               w=CRFS(feature',f,lamda);
        cal=data'*w;
        erro=cal-ture(i,:)';
        a=sum(erro.^2,1);
        a=sqrt(a);
        c=atan(a.*0.027/50);
        b1=[b1 c];
    end
    
    b36=[b36 mean(b1)];
end
save b36;
mean(b36)


