%% ================================================================================
insert_data_chcl3_meth
NO_exp=10;%arithmos piramaton 
All_generations_RESULTS=[];
kp=1;
ga_test4b  
runResultspopsize=[];
while kp<NO_exp
    runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:);
    kp=kp+1
    ga_test4b
end
runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:);
filename = 'ACETONE_METH_MATLAB.xlsx';
xlswrite(filename,runResultspopsize,2)
