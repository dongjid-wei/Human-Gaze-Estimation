function b1= GetC( feature,feature1, sigma )
num=25;
b1=[];
data=load(strcat('C:\Users\lenovo\Desktop\����\New\���²ɼ�\ע�ӵ�����','\',num2str(num),'��.txt'));
ture=load(strcat('C:\Users\lenovo\Desktop\����\New\���²ɼ�\ע�ӵ�����','\','��������.txt'));
for i=1:36
    f=feature1(:,i);
    W = SimilarityMatrix( feature' , f , sigma ) ;  
    [w] = WCESR(feature',f,W);
    w(find(abs(w)<0.1))=0;
    w=w/sum(w);
    cal=data'*w;   
    erro=cal-ture(i,:)';   
    a=sum(erro.^2,1);
    a=sqrt(a);
    c=atan(a.*0.027/50);
    b1=[b1,c];  
end
end