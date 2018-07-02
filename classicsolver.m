% insert_data_BENZ_ISOPRO
% x0=[10 10];
% x0=[-664.517622649858,448.908713462131,905.340942693372,1508.60606346376,-100.646994812078,-295.820691775821];

%ff=@(du) 1/FIT_function_flex(du,components)
ff=@(du) 1/FIT_function_flexTP(du,components);
%%
% ff= @(du) gammacalc(du(1),du(2),du(3),du(4),du(5),du(6))
% ff=@(x)1/petama(x(1),x(2),x(3),x(4),x(5),x(6));
% f=@(x)1/Fit_functionT(x(1),x(2)); du0=[-173.3*R 204.5*R 88.33*R 669.96*R
% -43.9*R -132.6*R]; du0=[-316.76*R 228.16*R 383.21*R 692.77*R -51.92*R
% -141.75*R]; zsxq1000=[-316.30*R 227.93*R 381.65*R 699.42*R -51.88*R
% -142.00*R];
%dd6=[-628.554523000000,452.944775300000,758.418696500000,1389.89441820000,-103.096454800000,-282.183820000000]
%dd12=[263.90 668.50 63.07 -18.05 111.40 -327.48 388.05 172.09 -290.26 148.28 469.57 460.57]
% du0=[1000 1000 1000 1000 1000 1000];
% orio=1000;
% for k=1:12
%     du0(1,k) = round(rand*(orio*2)-orio); 
% end% create a table 6xpop_size (6 du per solution)
% %%
% du0=ones(1,12)*10000/7;
% load('output6x200.mat')
load('option_clas_solver.mat');
load('optionfminimax.mat')
lsqnonlin_results=[];
fminsearch_results=[];
fminimax_results=[];
iv=1;
for i=1:1000 %create the first score data
    for k=1:12
        gen_1_Duvalues(k,i) = round(rand*(Dumax-Dumin)+Dumin);
    end% create a table 6xpop_size (6 du per solution)
     
end
while iv <= 10000
    du0(:)=gen_1_Duvalues(:,iv);
    
    tic
    du=[];
    
    [du,resnorm,resixal,exitflag,output] = lsqnonlin(ff,du0,[],[],options);
    lsqnonlin_results(iv,1:12)=du(:);lsqnonlin_results(iv,13)=1/resixal;lsqnonlin_results(iv,14)=toc;
    % lsqnonlin_results=sortrows(lsqnonlin_results,7);
    %%
    
    tic
    du=[];
    [du,fval] = myfminsearch(ff,du0,2000,2000)
    fminsearch_results(iv,1:12)=du(:);fminsearch_results(iv,13)=1/fval;fminsearch_results(iv,14)=toc;
    %fminsearch_results=sortrows(fminsearch_results,7);
    
    %%
    dumin=[];
    tic
    try
        [dumin,fval2] = fminimax(ff,du0,[],[],[],[],[],[],[],optionsfminimax);
        fminimax_results(iv,1:12)=dumin(:);fminimax_results(iv,13)=1/fval2;fminimax_results(iv,14)=toc;
        %     fminimax_results=sortrows(fminimax_results,7);
    end
    % % du/R
    % %petama(x(1),x(2),x(3),x(4),x(5),x(6))
    % Fit_function_TERN(du(1),du(2),du(3),du(4),du(5),du(6))
    % du0=du;
    iv=iv+1
   end
% du0
% sol=[1/resixal  1/fval  1/fval2]


%% check results for succesfull ones

%  lsqnonlin_resultsSUCCES= sum(sum(lsqnonlin_results(:,13)> 14.86))
%  fminsearch_resultsSUCCESS= sum(sum(fminsearch_results(:,13)> 14.86))
%  fminimax_resultsSUCCESS=sum(sum(fminimax_results(:,13)> 14.86))

 orio=5; 
 lsqnonlin_resultsSUCCES= sum(sum(lsqnonlin_results(:,13)>orio));
 fminsearch_resultsSUCCESS= sum(sum(fminsearch_results(:,13)> orio));
 fminimax_resultsSUCCESS=sum(sum(fminimax_results(:,13)> orio));
%  
FINAL_SUCCES=[lsqnonlin_resultsSUCCES fminsearch_resultsSUCCESS fminimax_resultsSUCCESS]
% summary(T)
%[x,fval] = fminunc(ff,du0);1/fval
%[x,fval] = fminsearch(ff,du0); 1/fval
%1/fval
%du=du0;
% options.Algorithm = 'levenberg-marquardt';
% [x,resnorm,resixal,exitflag,output] = lsqnonlin(ff,x0,[],[],options);

