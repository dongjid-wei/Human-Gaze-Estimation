x=1:10;
y=cumsum(randn(1,10));
lower = y - (rand(1,10));
upper = y + (rand(1,10));
bar(x,y);
legend('���ķ���','Muti-CNN','RF','KNN','ALR','SVR');