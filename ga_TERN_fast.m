tic
%% define the range of energy paramaters Äu
Dumin=-10000; Dumax=10000;
%% insert GA parameters
components=3;% triadiko diadiko migma???
du_number=components*(components-1);
pop_size = 200;
mutation_probability = 0.13;
cross_prob=0.7;
number_of_generations = 10000;
FITtol=0.01;
multi_pop_size=10;%poses fores polaplasios o arxikos plithismos
i_stop=0;
%% CREATE INITIAL POPULATION
inimutation_probability=mutation_probability;
gen_1_Duvaluesfast=[];
gen_1_DuFITvalues=[];
All_generations_RESULTS=[];%zeros(number_of_generations,8);
fitness=0;
ll=0;
for i=1:multi_pop_size*pop_size
    for k=1:du_number
        gen_1_DuFITvalues(i,k) = round(rand*(Dumax-Dumin)+Dumin);
    end% create a table 6xpop_size (6 du per solution)
    fitness_tmp = Fit_function_TERN(gen_1_DuFITvalues(i,1),gen_1_DuFITvalues(i,2),gen_1_DuFITvalues(i,3),gen_1_DuFITvalues(i,4),gen_1_DuFITvalues(i,5),gen_1_DuFITvalues(i,6)); % evaluate the fit function for each sol.
    gen_1_DuFITvalues(i,7) =  fitness_tmp;
end
gen_1_DuFITvalues=sortrows(gen_1_DuFITvalues,7);
%% create initiali pop misa-misa
for i=1:pop_size/2 %create the first score data
    for k=1:du_number
        gen_1_Duvaluesfast(k,i) = gen_1_DuFITvalues(pop_size*multi_pop_size-i+1,k);
    end
    gen_1_fitvalues(i) =  gen_1_DuFITvalues(pop_size*multi_pop_size-i+1,7);
end

for i=pop_size/2 :pop_size %create the first score data
    for k=1:du_number
        gen_1_Duvaluesfast(k,i) = round(rand*(Dumax-Dumin)+Dumin);
    end% create a table 6xpop_size (6 du per solution)
    
    fitness_tmp = Fit_function_TERN(gen_1_Duvaluesfast(1,i),gen_1_Duvaluesfast(2,i),gen_1_Duvaluesfast(3,i),gen_1_Duvaluesfast(4,i),gen_1_Duvaluesfast(5,i),gen_1_Duvaluesfast(6,i)); % evaluate the fit function for each sol.
    gen_1_fitvalues(i) =  fitness_tmp;
end
save('outputfast6x200.mat','gen_1_Duvaluesfast')

fitness = sum(gen_1_fitvalues);%Create total fitness
%% Getting maximum value for initial population
max_fit_gen1 = 0;
max_fit_gen1 = gen_1_fitvalues(1);
max_Du_gen1(:,1) = gen_1_Duvaluesfast(:,1);

%% Starting GA loop
All_generations_RESULTS=[];
i=0
while  i<number_of_generations
    i=i+1;
    %Reseting list for 2nd generation
    gen_2_Duvalues=[];
    gen_2_fitvalues=[];
    selected = [];
    ind_AB=zeros(6,1);ind_BA=zeros(6,1);
    %Selecting individuals to reproduce
    for j=1:pop_size
        ind_sel = rouletteDU(gen_1_fitvalues,fitness);
        selected(:,j) = gen_1_Duvaluesfast(:,ind_sel);
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
        
        change_point=round((du_number-1)*rand+0.5);
        %% new individual AB
        for ii=1:change_point
            ind_AB(ii,1) =sel_ind_B(ii,1);
            ind_BA(ii,1) =sel_ind_A(ii,1);
        end
        for ii=change_point:du_number
            ind_AB(ii,1) =sel_ind_A(ii,1);
            ind_BA(ii,1) =sel_ind_B(ii,1);
        end
        
        %% Creating kids
        kids(:,j)=ind_AB(:,1);
        kids_fitvalues(j) =Fit_function_TERN(kids(1,j),kids(2,j),kids(3,j),kids(4,j),kids(5,j),kids(6,j));
        
        kids(:,j+1) = ind_BA(:,1);
        kids_fitvalues(j+1) =Fit_function_TERN(kids(1,j+1),kids(2,j+1),kids(3,j+1),kids(4,j+1),kids(5,j+1),kids(6,j+1));
        
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
    %========================EDW==================
    %% oloklirotiko mutation
    for j=1:pop_size
        %         mutation_probability=mutation_probability^(1-i/number_of_generations);
        GG=0;
        for ii =1:du_number
            ran_mut = rand;
            if ran_mut < mutation_probability
                gen_2_Duvalues(ii,j) =  NONuniMUTA(Dumax,Dumin,gen_2_Duvalues(ii,j),i,number_of_generations);
                GG=1;
            end
        end
        if GG==1
            gen_2_fitvalues(j)=Fit_function_TERN(gen_2_Duvalues(1,j),gen_2_Duvalues(2,j),gen_2_Duvalues(3,j),gen_2_Duvalues(4,j),gen_2_Duvalues(5,j),gen_2_Duvalues(6,j));
        end
    end
  
    %% Getting maximum value
    max_fit_gen2 = 0;
    for j=1:pop_size
        if gen_2_fitvalues(j) >= max_fit_gen2
            max_fit_gen2 = gen_2_fitvalues(j);
            max_Du_gen2(:,1) = gen_2_Duvalues(:,j);
        end
    end
    
    %% STOP CRITIRIO XTOL
    %     du_dif=abs(max_Du_gen2(:,1)-max_Du_gen1(:,1));
    %
    %     if max(du_dif)<max_tol
    %         break
    %     end
    %%
    
    %stop by 30% same maximum
    if abs(max_fit_gen1-max_fit_gen2)/max_fit_gen2 <FITtol && i>number_of_generations*0.05 && i<number_of_generations*0.9
        i_stop=i_stop+1;
    else
        i_stop=0;
    end
%     if i_stop/i>0.25 && i>number_of_generations*0.05    
    if i_stop/i>0.28*(1-i/number_of_generations) && i>number_of_generations*0.05 && i<number_of_generations*0.9  
    if i<number_of_generations*0.9
      i=round( number_of_generations*0.9);
    end   
    end
    if ll<5
    if i>number_of_generations*0.97 && (-max_fit_gen1+max_fit_gen2)/max_fit_gen2>FITtol*3
        number_of_generations=round(number_of_generations+number_of_generations*0.03);
        ll=ll+1;
    end
    end

    if max_fit_gen1 >= max_fit_gen2
        max_fit_gen2 = max_fit_gen1;
        max_Du_gen2(:,1)= max_Du_gen1(:,1);
        gen_2_fitvalues(1) = max_fit_gen1;
        gen_2_Duvalues(:,1) =  max_Du_gen1(:,1);
        
    end
    
    
    %Transform gen2 into gen1
    gen_1_Duvaluesfast = gen_2_Duvalues;
    gen_1_fitvalues = gen_2_fitvalues;
    max_Du_gen1(:,1)= max_Du_gen2(:,1);
    max_fit_gen1 = max_fit_gen2;
    for ii=1:du_number
        All_generations_RESULTS(i,ii) = max_Du_gen2(ii,1);
    end
    All_generations_RESULTS(i,7) = max_fit_gen2;
    %Creating new fitness
    fitness = sum( gen_2_fitvalues);
    i
end
All_generations_RESULTS(number_of_generations,8) = toc;
All_generations_RESULTS( ~any(All_generations_RESULTS,2), : ) = [];  %rows
% %% GRAPH
% x=1:10000;
% y=All_generations_RESULTS(:,7);
% plot(x,y,'o')
%  legend('fit')
