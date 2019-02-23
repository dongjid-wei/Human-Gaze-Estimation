function w=WCORR(X,y,mean_x)
nIter        =   10;
D=X;
% [disc_set,disc_value,Mean_Image]=Eigenface_f(D,260);
% disc_value = sqrt((disc_value));
% mean_x       =    Mean_Image+0.001*disc_set*disc_value';
% mean_x       =   mean(D,2);
lambda       =   0.005;
sigma        =   0.5;
iter         =   120; 
beta         =   0.1; 

residual     =   (y-mean_x).^2;
w            =   1./(1+1./exp(-beta*(residual-iter)));
w_y_o        =   w.*y;
norm_w_y_o   =   norm(w_y_o,2);

ll           =   size(D,2);

for nit = 1: nIter
    fprintf('.');
    ww = w./max(w);
    index_w = find(ww>=1e-3);

    WW_index = repmat(w(index_w),[1 ll]);
    W_D      = WW_index.*D(index_w,:);
    W_y = w(index_w).*y(index_w);

    ratio = norm(W_y,2)/norm_w_y_o;
    temp_s             =  l1_ls(W_D,W_y,lambda*ratio,sigma*ratio,true); 
    residual           =   (y-D*temp_s).^2;
    w                  =   1./(1+1./exp(-beta*(residual-iter)));

end

w=temp_s;


end