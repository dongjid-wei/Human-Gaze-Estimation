
%%

clc;
clear all;
num=25; %( 4 9 16 25 36)
numl=5; %( 1 2 4 5 6)
b4=[];
for numl=1:1
feature=f_training; %��ȡѵ��������
feature1=f_testing; %��ȡ������������
    
s=[];
ff=[];
b1=[];
ft0=0.20;
for sigma = 1:-0.0025:0.2;
b1=[];
b1= GetC(feature,feature1,sigma);

ft=std(b1);
if ft<ft0
    ft0=ft;
    count=0;
    sigma_flag=sigma;
else
    if  ft-ft0>=0.015 
        break;
    end
end

plot(sigma,ft,'--or');
hold on;
s=[ s sigma_flag];
ff=[ff,ft0];
end

plot(s,ff,'ro-')
xlabel('�˴����')
ylabel('��� std')
end
%%
% mean(b1)
% std(b1)
mean(b1)
std(b1)
ft0
sigma_flag



