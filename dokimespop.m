insert_data_gammaexp
NO_exp=50;%arithmos piramaton 
All_generations_RESULTS=[];
for ii=1:2:10
pop_size = 10*ii;
mutation_probability = 0.4;
cross_prob=0.9;
number_of_generations = 1000;
multi_pop_size=100;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test_4_preinitial   
while kp<NO_exp
    runResultspopsize(kp,ii)=All_generations_RESULTS(number_of_generations,3)
    kp=kp+1
    ga_test_4_preinitial
end
runResultspopsize(kp,ii)=All_generations_RESULTS(number_of_generations,3);
end
filename = 'popsize2.xlsx';
xlswrite(filename,runResultspopsize,1)
%==============================================================================
insert_data_gammaexp
All_generations_RESULTS=[];
for ii=1:2:10
pop_size = 20;
mutation_probability = 0.01+ii*0.05;
cross_prob=0.9;
number_of_generations = 500;
multi_pop_size=100;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test_4_preinitial   
while kp<NO_exp
    runResultsMUTprob(kp,ii)=All_generations_RESULTS(number_of_generations,3)
    kp=kp+1
    ga_test_4_preinitial
end
runResultsMUTprob(kp,ii)=All_generations_RESULTS(number_of_generations,3);
end
filename = 'popsize.xlsx';
xlswrite(filename,runResultsMUTprob,2)
%===================================================================================
insert_data_gammaexp
All_generations_RESULTS=[];
for ii=1:2:10
pop_size = 20;
mutation_probability = 0.4;
cross_prob=0.5+0.045*ii;
number_of_generations = 500;
multi_pop_size=100;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test_4_preinitial   
while kp<NO_exp
    runResultscrossprob(kp,ii)=All_generations_RESULTS(number_of_generations,3)
    kp=kp+1
    ga_test_4_preinitial
end
runResultscrossprob(kp,ii)=All_generations_RESULTS(number_of_generations,3);
end
filename = 'popsize.xlsx';
xlswrite(filename,runResultscrossprob,3)
%--------
insert_data_gammaexp
All_generations_RESULTS=[];
for ii=1:2:10
pop_size = 20;
mutation_probability = 0.4;
cross_prob=0.9;
number_of_generations = 500+250*ii;
multi_pop_size=100;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test_4_preinitial   
while kp<NO_exp
    runResultsNOGEN(kp,ii)=All_generations_RESULTS(number_of_generations,3)
    kp=kp+1
    ga_test_4_preinitial
end
runResultsNOGEN(kp,ii)=All_generations_RESULTS(number_of_generations,3);
end
filename = 'popsize.xlsx';
xlswrite(filename,runResultsNOGEN,4)
%------------
insert_data_gammaexp
All_generations_RESULTS=[];
for ii=1:2:10
pop_size = 20;
mutation_probability = 0.4;
cross_prob=0.9;
number_of_generations = 1000;
multi_pop_size=1;
kp=1;
All_generations_RESULTS=[]; 
kp=1;
ga_test_4_preinitial   
while kp<NO_exp
    runResultsmulti(kp,ii)=All_generations_RESULTS(number_of_generations,3)
    kp=kp+1
    ga_test_4_preinitial
end
runResultsmulti(kp,ii)=All_generations_RESULTS(number_of_generations,3);
end
filename = 'pop_multi.xlsx';
xlswrite(filename,runResultsmulti,5)