%% ================================================================================
insert_data_acetone_water
NO_exp=250;%arithmos piramaton 
All_generations_RESULTS=[];
kp=1;
ga_test4b  
runResultspopsize=[];
while kp<NO_exp
    runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:)
    kp=kp+1
    ga_test4b
end
runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:);
filename = 'acetone_Water.xlsx';
xlswrite(filename,runResultspopsize,3)
