
%%

feature=[];    %��ʼ��
feature1=[];
num=9; %( 4 9 16 25 36)
numl=5; %( 1 2 4 5 6)
b4=[];

for numl=1:1

feature=f_training; %��ȡѵ��������
feature1=f_testing; %��ȡ������������

b1=[];
sigma = 0.2410; %ֱ��ָ��sigma
b1= GetC( feature,feature1, sigma );   %��������ؼ���Ȩֵ

end
%%
mean(b1)
std(b1)




