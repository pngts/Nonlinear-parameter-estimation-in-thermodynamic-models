insert_data_gammaexp
NO_exp=100;%arithmos piramaton 
All_generations_RESULTS=[];
k=1;
ga_test1
while k<NO_exp
    runResults(k,1)=All_generations_RESULTS(number_of_generations,3);
    k=k+1;
    %ga_test2_withCROSSprob
    %ga_test3_pc
    ga_test1
end
runResults(k,1)=All_generations_RESULTS(number_of_generations,3);

All_generations_RESULTS=[];
k=1;
ga_test2_mutALL
while k<NO_exp
    runResults(k,2)=All_generations_RESULTS(number_of_generations,3);
    k=k+1;
    ga_test2_mutALL
end  
runResults(k,2)=All_generations_RESULTS(number_of_generations,3);

All_generations_RESULTS=[];
k=1;
ga_test3_pc
while k<NO_exp
    runResults(k,3)=All_generations_RESULTS(number_of_generations,3);
    k=k+1;
    ga_test3_pc
end
runResults(k,3)=All_generations_RESULTS(number_of_generations,3);

All_generations_RESULTS=[];
k=1;
ga_test_4_preinitial
while k<NO_exp
    runResults(k,4)=All_generations_RESULTS(number_of_generations,3);
    k=k+1;
    ga_test_4_preinitial
end
runResults(k,4)=All_generations_RESULTS(number_of_generations,3);

All_generations_RESULTS=[];
k=1;
ga_test_5_2pointsRLTT_PI
while k<NO_exp
    runResults(k,5)=All_generations_RESULTS(number_of_generations,3);
    k=k+1;
    ga_test_5_2pointsRLTT_PI
end
runResults(k,5)=All_generations_RESULTS(number_of_generations,3);






