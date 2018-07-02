
% insert_data_exp_TERNset2_150 % insert_data_exp_TERNSET2_150_TP
% insert_data_acet_chcl3 %insert_data_acet_chcl3_TP
% insert_data_chcl3_meth %insert_data_chcl3_meth_TP
% insert_data__acetone_meth2 %insert_data__acetone_meth2_TP


% insert_data_exp_TERNset1 
% insert_data__acetone_meth %insert_data__acetone_meth_TP
% insert_data_acetone_water %insert_data_acetone_water_TP
% insert_data_meth_ater %insert_data_meth_water_TP

%insert_quaternary1

% insert_inglesiasTP
%du=[-130.2535 -34.51268 -81.56071 -179.9613 -873.6794 304.4958]
sheet=1;sheet2=1;
cc=[];
% while sheet<=7
%     
% hybrid_ga_fminsearch1
% % classicsolver
% ff=@(du) 1/FIT_function_flex(du,components);
% dupart=particleswarm(ff,6,-10000,10000);
% FIT_function_flex(dupart,components)
% filename = 'HYBRID_TEST.xlsx';
% BB=All_generations_RESULTS;
% 
% % xlswrite(filename,gen_1_Duvaluesfast,sheet-1)
% xlswrite(filename,BB,sheet)
% sheet=1+sheet;
% end

while sheet2<=10
     
  hybrid_ga_fminsearch1_TP
% %hybrid_ga_fminsearch1
% classicsolver
% ff=@(du) 1/FIT_function_flex(du,components);
% dupart=particleswarm(ff,6, -10000*ones(1,components*2),10000*ones(1,components*2));
% BB(sheet2,:)=FIT_function_flex(dupart,components)
% filename = 'quat_compareauto2.xlsx';
BB(sheet2,:)=All_generations_RESULTS(length(All_generations_RESULTS),:);
save('BB_ALL.mat','BB')
% xlswrite(filename,protigennia,sheet2)
sheet2=1+sheet2;
end
% xlswrite(filename,BB,10)