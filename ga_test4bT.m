tic
%% define the range of energy paramaters Äu
Dumin=-25000; Dumax=25000;
% CREATE INITIAL POPULATION
pop_size = 50;
mutation_probability = 0.13;
cross_prob=0.7;
number_of_generations = 3000;
multi_pop_size=30;%poses fores polaplasios o arxikos plithismos
gen_1_Duvalues=[];
gen_1_DuFITvalues=[];
All_generations_RESULTS=zeros(number_of_generations,4);
fitness=0;
for i=1:multi_pop_size*pop_size
    gen_1_DuFITvalues(i,1) = round(rand*(Dumax-Dumin)+Dumin); % create a table 2x10 (2 du per solution)
    gen_1_DuFITvalues(i,2) = round(rand*(Dumax-Dumin)+Dumin);
    
    fitness_tmp = Fit_functionT(gen_1_DuFITvalues(i,1),gen_1_DuFITvalues(i,2)); % evaluate the fit function for each sol.
    gen_1_DuFITvalues(i,3) =  fitness_tmp;  
end
gen_1_DuFITvalues=sortrows(gen_1_DuFITvalues,3);
%% create initiali pop misa-misa
for i=1:pop_size/2 %create the first score data
    gen_1_Duvalues(1,i) = gen_1_DuFITvalues(pop_size*multi_pop_size-i+1,1);
    gen_1_Duvalues(2,i) = gen_1_DuFITvalues(pop_size*multi_pop_size-i+1,2);
    gen_1_fitvalues(i) =  gen_1_DuFITvalues(pop_size*multi_pop_size-i+1,3);
end

for i=pop_size/2 :pop_size %create the first score data
    gen_1_Duvalues(1,i) = round(rand*(Dumax-Dumin)+Dumin); % create a table 2x10 (2 du per solution)
    gen_1_Duvalues(2,i) = round(rand*(Dumax-Dumin)+Dumin);
    
    fitness_tmp = Fit_functionT(gen_1_Duvalues(1,i),gen_1_Duvalues(2,i)); % evaluate the fit function for each sol.
    gen_1_fitvalues(i) =  fitness_tmp;
    
    fitness = sum(gen_1_fitvalues);%Create total fitness
end
%% Getting maximum value for initial population
max_fit_gen1 = 0;
max_fit_gen1 = gen_1_fitvalues(1);
max_Du_gen1(:,1) = gen_1_Duvalues(:,1);
%% Starting GA loop
All_generations_RESULTS=[];
for i=1:number_of_generations
    %Reseting list for 2nd generation
    gen_2_Duvalues=[];
    gen_2_fitvalues=[];
    selected = [];
    ind_AB=[0;0];ind_BA=[0;0];
    %Selecting individuals to reproduce
    for j=1:pop_size
        ind_sel = rouletteDU(gen_1_fitvalues,fitness);
        selected(:,j) = gen_1_Duvalues(:,ind_sel);
        selectedFIT(j)=gen_1_fitvalues(ind_sel);
    end
    %% select parents
    jj=1;
    parents=[];kids=[];kids_fitvalues=[];parents_loc=[];
    for j=1:pop_size
        par_rand=rand;
        if par_rand<cross_prob
            parents(:,jj)=selected(:,j);
            parents_loc(jj)=j; % pou vriskonte sto selected
            jj=jj+1;
        end
    end
    if mod(jj,2)==0 %check oti einai zigos arithmos goniwn
        kk=round(rand*pop_size); %an iparxi mi simpliromeno zevgos pernw akomi ena gonio tixea 
        while kk==0 
           kk=round(rand*pop_size);
        end
        parents(:,jj)=selected(:,kk);
            parents_loc(jj)=kk;
    end    
    %% Crossing parents
    for j=1:2:length(parents_loc)
        sel_ind_A(:,1) = parents(:,j);
        sel_ind_B(:,1) = parents(:,j+1);
        %% new individual AB
        ind_AB(1,1) =sel_ind_A(1,1);
        ind_AB(2,1) =sel_ind_B(2,1);
        %% new individual BA
        ind_BA(1,1) =sel_ind_B(1,1);
        ind_BA(2,1) =sel_ind_A(2,1);
        %% Creating kids
        kids(:,j)=ind_AB(:,1);
        kids_fitvalues(j) =Fit_functionT(kids(1,j),kids(2,j));

        kids(:,j+1) = ind_BA(:,1);
        kids_fitvalues(j+1) =Fit_functionT(kids(1,j+1),kids(2,j+1));      

    end
     %% Creating Generation 2
     for pp=1:pop_size
         gen_2_Duvalues(:,pp)=selected(:,pp);
         gen_2_fitvalues(pp) =selectedFIT(pp);
     end  
     % replace parents with kids
     for j=1:length(parents_loc)
         loc=parents_loc(j);
         if gen_2_fitvalues(loc)<kids_fitvalues(j)
         gen_2_Duvalues(:,loc)=kids(:,j);
         gen_2_fitvalues(loc) =kids_fitvalues(j);     
         end
     end
     
    %% oloklirotiko mutation
    for j=1:pop_size
        ran_mut = rand;
       mutation_probability=mutation_probability^(1-i/number_of_generations);
        if ran_mut < mutation_probability
            if ran_mut < mutation_probability/3
                gen_2_Duvalues(1,j) =  NONuniMUTA(Dumax,Dumin,gen_2_Duvalues(1,j),i,number_of_generations);
                gen_2_Duvalues(2,j) = NONuniMUTA(Dumax,Dumin,gen_2_Duvalues(2,j),i,number_of_generations);
                gen_2_fitvalues(j)=Fit_functionT(gen_2_Duvalues(1,j),gen_2_Duvalues(2,j));
            else
                sol_position = round(rand+1); % give us 1 or 2 to define what sol. we will change
                gen_2_Duvalues(sol_position,j) = NONuniMUTA(Dumax,Dumin,gen_2_Duvalues(sol_position,j),i,number_of_generations);
                gen_2_fitvalues(j)=Fit_functionT(gen_2_Duvalues(1,j),gen_2_Duvalues(2,j));
            end
        end
    end
    %% Getting maximum value
    max_fit_gen2 = 0;
    for j=1:pop_size
        if gen_2_fitvalues(j) >= max_fit_gen2,
            max_fit_gen2 = gen_2_fitvalues(j);
            max_Du_gen2(:,1) = gen_2_Duvalues(:,j);
        end
    end
    %Elitism one individual (stin proti lisi )
    if max_fit_gen1 > max_fit_gen2,
        max_fit_gen2 = max_fit_gen1;
        max_Du_gen2(:,1)= max_Du_gen1(:,1);
        gen_2_fitvalues(1) = max_fit_gen1;
        gen_2_Duvalues(:,1) =  max_Du_gen1(:,1);
    end
    %Transform gen2 into gen1
    gen_1_Duvalues = gen_2_Duvalues;
    gen_1_fitvalues = gen_2_fitvalues;
    max_Du_gen1(:,1)= max_Du_gen2(:,1);
    max_fit_gen1 = max_fit_gen2;
    All_generations_RESULTS(i,1) = max_Du_gen2(1,1);
    All_generations_RESULTS(i,2) = max_Du_gen2(2,1);
    All_generations_RESULTS(i,3) = max_fit_gen2;
    %Creating new fitness
    fitness = sum( gen_2_fitvalues);
    i
end
%% last exploration

All_generations_RESULTS(number_of_generations,4) = toc;