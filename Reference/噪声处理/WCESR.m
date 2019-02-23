function [w] =WCESR(A,b,W)

[m n]=size(A);

condition=1;
count=0;
w=A'*b;
alpha=1.e-6;
while condition
    % ���ȵõ�p   Ȼ��ĵ�w  �����ȳ�ʼ��
      weight = (A *w-b).^2; 
      weight = exp(-weight/(1*mean(weight)));  %�õ�p��ֵ
      w1 = sqrt(weight);                       %sqrt(p)��ֵ
      % X��y ��ֵ�ñ仯
      [dt,dt1] = size(A);
        for i1=1:dt1
            X_X(:,i1)= A(:,i1).*w1;  %�൱��X
        end    
      y_y=w1.*b;      
     w=(X_X'*X_X+alpha*diag(W))\X_X'*y_y;     
    count=count+1;
    if count>200
        break;
    end
end















end