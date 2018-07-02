
% insert_data_exp_TERNset2_150
fminsearch_results_hyp=[];
% lisis_ga150=[]
% lisis_ga1502=[]
for pio=1:length(lisis_ga150)
du0=lisis_ga150(pio,:);
tic
    du=[];
    [du,fval] = myfminsearch(du0,2000,2000);
    fminsearch_results_hyp(pio,1:6)=du(:);fminsearch_results_hyp(pio,7)=1/fval;fminsearch_results_hyp(pio,8)=toc;
    %fminsearch_results=sortrows(fminsearch_results,7);
    
    progress=pio/length(lisis_ga150)*100
end
fminsearch_results_hyp3=[]
for pio=1:length(lisis_ga1502)
du0=lisis_ga1502(pio,:);
tic
    du=[];
    [du,fval] = myfminsearch(du0,2000,2000);
    fminsearch_results_hyp3(pio,1:6)=du(:);fminsearch_results_hyp3(pio,7)=1/fval;fminsearch_results_hyp3(pio,8)=toc;
    %fminsearch_results=sortrows(fminsearch_results,7);
    
    progress=pio/length(lisis_ga1502)*100
end