% %% ================================================================================
% insert_data_exp_TERNset2_150
% NO_exp=5;%arithmos piramaton 
% All_generations_RESULTS=[];
% kp=1;
% ga_test4b_TERN
% runResultspopsize=[];
% while kp<NO_exp
%     runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:);
%     kp=kp+1
%   ga_test4b_TERN
% end
% runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:);
% filename = 'tern_set2150_MATLAB.xlsx';
% xlswrite(filename,runResultspopsize,3)
for metrt=1:8
    switch metrt 
        case 1
insert_data_exp_TERNset2_150
 case 2
insert_data_exp_TERNset1
 case 3
insert_data_acet_chcl3
 case 4
insert_data_chcl3_meth
 case 5
insert_data__acetone_meth2
 case 6
insert_data_acetone_water
 case 7
insert_data_meth_ater
 case 8
insert_data__acetone_meth
    end

sheet=1;sheet2=1;
cc=[];
while sheet2<=1
 
hybrid_ga_fminsearch1

filename = 'HYBRID_TEST_ALL.xlsx';
BB(sheet2,:)=All_generations_RESULTS(length(All_generations_RESULTS),:);

xlswrite(filename,BB,metrt)
sheet2=1+sheet2;
end
end
