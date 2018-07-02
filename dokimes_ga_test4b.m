  %% ================================================================================
insert_data_exp_TERN
NO_exp=10;%arithmos piramaton 
All_generations_RESULTS=[];
%
Dumin=-25000; Dumax=25000;
pop_size = 200;
mutation_probability = 0.13;
cross_prob=0.7;
number_of_generations = 10000;
multi_pop_size=1;                             

kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test4b_TERN  
runResultspopsize=[];
while kp<NO_exp
    runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:)
    kp=kp+1
    ga_test4b_TERN
end
runResultspopsize(kp,:)=All_generations_RESULTS(number_of_generations,:);
filename = 'TERNga_4b.xlsx';
xlswrite(filename,runResultspopsize,2)
%end
%% ==========================================================================
insert_data_gammaexp
NO_exp=100;%arithmos piramaton 
All_generations_RESULTS=[];
for ii=1:4
pop_size = 50;
mutation_probability = 0.1*ii;
cross_prob=0.9;
number_of_generations = 1000;
multi_pop_size=10;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test4b  
runResultmutation=[];
while kp<NO_exp
    runResultmutation(kp,:)=All_generations_RESULTS(number_of_generations,:)
    kp=kp+1
    ga_test4b
    ii
end
runResultmutation(kp,:)=All_generations_RESULTS(number_of_generations,:);
filename = 'mutation_ga_4b3.xlsx';
xlswrite(filename,runResultmutation,ii)
end
%% ======================================================================
insert_data_gammaexp
NO_exp=100;%arithmos piramaton 
All_generations_RESULTS=[];
for ii=1:5
pop_size = 50;
mutation_probability = 0.001;
cross_prob=0.45+0.1*ii;
number_of_generations = 1000;
multi_pop_size=10;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test4b  
runResultcross_prob=[];
while kp<NO_exp
    runResultcross_prob(kp,:)=All_generations_RESULTS(number_of_generations,:)
    kp=kp+1
    ii
    ga_test4b
end
runResultcross_prob(kp,:)=All_generations_RESULTS(number_of_generations,:);
filename = 'crossover_ga_4b.xlsx';
xlswrite(filename,runResultcross_prob,ii)
end
%% ======================================================================
insert_data_gammaexp
NO_exp=100;%arithmos piramaton 
All_generations_RESULTS=[];
for ii=1:4
pop_size = 50;
mutation_probability = 0.07;
cross_prob=0.9;
number_of_generations = 3000+500*ii;
multi_pop_size=10;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test4b  
runResultNumb_GEN=[];
while kp<NO_exp
    runResultNumb_GEN(kp,:)=All_generations_RESULTS(number_of_generations,:)
    kp=kp+1
    ii
    ga_test4b
end
runResultNumb_GEN(kp,:)=All_generations_RESULTS(number_of_generations,:);
filename = 'numbGENERATIONS_ga_4b2.xlsx';
xlswrite(filename,runResultNumb_GEN,ii)
end
%% ======================================================================
insert_data_gammaexp
NO_exp=100;%arithmos piramaton 
All_generations_RESULTS=[];
 for ii=1:2:12
pop_size = 50;
mutation_probability = 0.001;
cross_prob=0.9;
number_of_generations = 1000;
multi_pop_size=10*ii;
kp=1;
All_generations_RESULTS=[];
kp=1;
ga_test4b  
runResultMULTI_POPSIZE=[];
while kp<NO_exp
    runResultMULTI_POPSIZE(kp,:)=All_generations_RESULTS(number_of_generations,:)
    kp=kp+1
    ga_test4b
end
runResultMULTI_POPSIZE(kp,:)=All_generations_RESULTS(number_of_generations,:);
filename = 'numbMULTI_POPSIZE_ga_4b.xlsx';
xlswrite(filename,runResultMULTI_POPSIZE,ii)
end
