function k=getfea(I)
f=[];
f1=[];
I=rgb2gray(I);
I=histeq(I);
[m n]=size(I);
[Ix,Iy]=gradient(double(I));
I1=sqrt(Ix.^2+Iy.^2);
for i=1:3
    for j=1:5
        sum1=I(((i-1)*(m/3)+1):(m/3)*i,((j-1)*(n/5)+1):(n/5)*j);  %��ȡ����ֵ֮��
%         sum2=I1(((i-1)*(m/3)+1):(m/3)*i,((j-1)*(n/5)+1):(n/5)*j);  %��ȡ�ݶ�ֵ֮��
        f=[sum(sum1(:));f];
%         f1=[sum(sum2(:));f1];
    end
end

% f=f/sum(f);
% f1=f1/sum(f1);
k=[f;f1]/(sum(f)+sum(f1));