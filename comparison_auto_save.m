insert_data_exp_TERNset2_150
sheet=0;
while sheet<5
    %ga_test4b_TERN
    ga_test4b_TERN_STOP1
    sheet=sheet+1
    filename = 'comparison_AUTOSAVE2_stop_150.xlsx';
    
    xlRange1 = 'A1';
    BB(:)=All_generations_RESULTS(length(All_generations_RESULTS),:);
    xlswrite(filename,BB,sheet,xlRange1)
    
    load('outputB_stop_6x200.mat')
    
    classicsolver
    xlRange3 = 'A10:H207';
    xlswrite(filename,lsqnonlin_results,sheet,xlRange3)
    
    xlRange4 = 'J10:S207';
    xlswrite(filename,fminsearch_results,sheet,xlRange4)
    
    xlRange5 = 'U10:AD207';
    xlswrite(filename,fminimax_results,sheet,xlRange5)
    
    xlRange2 = 'A2:GS7';
    load('outputB_stop_6x200.mat')
    xlswrite(filename,gen_1_Duvalues,sheet,xlRange2)
    
end