clear all;
close all;
clc;

stImageFilePath  = 'C:\Users\iair\Desktop\36_Eye\';
stImageSavePath  = 'C:\Users\iair\Desktop\11\';
dirImagePathList = dir(strcat(stImageFilePath,'*.jpg'));        %��ȡ��Ŀ¼��ȫ��ͼƬ��·�����ַ�����ʽ��
iImageNum        = length(dirImagePathList);                    %��ȡͼƬ��������
if iImageNum > 0                                                %��������ͼƬ��������ټ�y����������y
   for i = 1 : iImageNum
      iSaveNum      = int2str(i);
       stImagePath   = dirImagePathList(i).name;
       img = imread(strcat(stImageFilePath,stImagePath)); 
%img=imread('3.jpg');
img1=img;
imshow(img);
[m n]=size(img);
img=double(img);

%%canny��Ե����ǰ������Բ����ӣ������Ҿ�ֱ�ӵ���ϵͳ������
%%��˹�˲�
w=fspecial('gaussian',[5 5]);
img=imfilter(img,w,'replicate');
figure;
imshow(uint8(img))

%%sobel��Ե���
w=fspecial('sobel');
img_w=imfilter(img,w,'replicate');      %����Ե
w=w';
img_h=imfilter(img,w,'replicate');      %������Ե
img=sqrt(img_w.^2+img_h.^2);        %ע�����ﲻ�Ǽ򵥵���ƽ��������ƽ�����ڿ������������ó�һ��ʱ�䶼�����
figure;
imshow(uint8(img))

%%�����ǷǼ�������
new_edge=zeros(m,n/3);
for i=2:m-1
    for j=2:n/3-1
        Mx=img_w(i,j);
        My=img_h(i,j);
        
        if My~=0
            o=atan(Mx/My);      %��Ե�ķ��߻���
        elseif My==0 && Mx>0
            o=pi/2;
        else
            o=-pi/2;            
        end
        
        %Mx����My��img���в�ֵ
        adds=get_coords(o);      %��Ե���ط���һ����õ��������꣬��ֵ��Ҫ       
        M1=My*img(i+adds(2),j+adds(1))+(Mx-My)*img(i+adds(4),j+adds(3));   %��ֵ��õ������أ��ô����غ͵�ǰ���رȽ� 
        adds=get_coords(o+pi); %��Ե������һ����õ��������꣬��ֵ��Ҫ
        M2=My*img(i+adds(2),j+adds(1))+(Mx-My)*img(i+adds(4),j+adds(3));   %��һ���ֵ�õ������أ�ͬ���͵�ǰ���رȽ�
        
        isbigger=(Mx*img(i,j)>M1)*(Mx*img(i,j)>=M2)+(Mx*img(i,j)<M1)*(Mx*img(i,j)<=M2); %�����ǰ������ߵ㶼����1
        
        if isbigger
           new_edge(i,j)=img(i,j); 
        end        
    end
end
figure;
imshow(uint8(new_edge))

%%�������ͺ���ֵ����
up=90;     %����ֵ
low=90;    %����ֵ
set(0,'RecursionLimit',10000);  %�������ݹ����
for i=1:m
    for j=1:n/3
      if new_edge(i,j)>up &&new_edge(i,j)~=255  %�ж�����ֵ
            new_edge(i,j)=255;
            new_edge=connect(new_edge,i,j,low);
      end
    end
end
%se = [1,1,1;1,1,1;1,1,1];
se = strel('disk',3);
new_edge=imdilate(new_edge,se);
new_edge=im2bw(uint8(new_edge),0.6);
new_edge= bwareaopen(new_edge,100);
new_edge=im2uint8(new_edge);
figure;imshow(new_edge);hold on;


new_edge=im2bw(new_edge);
status=regionprops(new_edge,'BoundingBox');
figure;imshow(img1);hold on;
%rectangle('position',status(1).BoundingBox,'edgecolor','r');
[r, c]=find(new_edge==1);
[rectx,recty,area,perimeter] = minboundrect(c,r,'p'); 
line(rectx(:),recty(:),'color','g');
img2=imcrop(img1,status(1).BoundingBox);
%imwrite(img2,'C:\Users\iair\Desktop\1.jpg');

imwrite(img2,strcat(stImageSavePath,iSaveNum,'.jpg')); 
   end
end

%figure;
%imshow(new_edge==255)