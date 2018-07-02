tic
%% define the range of energy paramaters Äu
Dumin=-10000; Dumax=10000;
%% insert GA parameters
% triadiko diadiko migma???
du_number=components*(components-1);
hybrid=1; % 1 gia na treksi to ivridio 0 mono o genetikos
stop_critirion=1; %otan den allazei simantika i lisi
switch components
    case 2
        pop_size = 50;
        number_of_generations = 3000;
        multi_pop_size=30;%poses fores polaplasios o arxikos plithismos
        ff=@(du_fmin) 1/FIT_function_flex(du_fmin,2);
        %%%
        FITtol=0.01;
        minFITtarget=1.5; %triadika 0.3
        STOP_SENS=0.2;%0.3
        %%% rithmisis fminsearch
        STOP_SENS2=0.1;%0.1 protinw gia triadika sto 0.001 gia diadika 0.2 0.4
        clas_check=20;%15 kathe posa gen na ipologizi fminsearch
        
    case 3
        pop_size = 200;
        number_of_generations = 10000;
        multi_pop_size=10;%poses fores polaplasios o arxikos plithismos
        ff=@(du_fmin) 1/FIT_function_flex(du_fmin,3);
        FITtol=0.01;
        %%%
        minFITtarget=0.5;
        STOP_SENS=0.14;
        %%%
        STOP_SENS2=0.005;
        clas_check=3;
end
mutation_probability = 0.13;
cross_prob=0.7;


i_stop=0;
clas_fit=0;
i_stop_clas=0;
du0=[];

%% CREATE INITIAL POPULATION
inimutation_probability=mutation_probability;
gen_1_Duvalues=[];
gen_1_DuFITvalues=[];
All_generations_RESULTS=[];%zeros(number_of_generations,8);
fitness=0;
ll=0;

for i=1:multi_pop_size*pop_size
    for k=1:du_number
        gen_1_DuFITvalues(i,k) = round(rand*(Dumax-Dumin)+Dumin);
    end% create a table 6xpop_size (6 du per solution)
    gen_1_DuFITvalues(i,du_number+1) =FIT_function_flex(gen_1_DuFITvalues(i,:),components); % evaluate the fit function for each sol.
end
gen_1_DuFITvalues=sortrows(gen_1_DuFITvalues,du_number+1);
%% create initiali pop misa-misa
for i=1:pop_size/2 %create the first score data
    for k=1:du_number
        gen_1_Duvalues(k,i) = gen_1_DuFITvalues(pop_size*multi_pop_size-i+1,k);
    end
    gen_1_fitvalues(i) =  gen_1_DuFITvalues(pop_size*multi_pop_size-i+1,du_number+1);
end

for i=pop_size/2+1 :pop_size %create the first score data
    for k=1:du_number
        gen_1_Duvalues(k,i) = round(rand*(Dumax-Dumin)+Dumin);
    end% create a table 6xpop_size (6 du per solution)
    
    gen_1_fitvalues(i) = FIT_function_flex(gen_1_Duvalues(:,i),components); % evaluate the fit function for each sol.
     
end
% save('outputB_stop_6x200.mat','gen_1_Duvalues')
fitness = sum(gen_1_fitvalues);%Create total fitness
%% Getting maximum value for initial population
max_fit_gen1 = 0;
max_fit_gen1 = gen_1_fitvalues(1);
max_Du_gen1(:,1) = gen_1_Duvalues(:,1);

%% Starting GA loop
All_generations_RESULTS=[];
i=0;
while  i<number_of_generations
    i=i+1;
    %Reseting list for 2nd generation
    gen_2_Duvalues=[];
    gen_2_fitvalues=[];
    selected = [];
    ind_AB=[];ind_BA=[];selectedFIT=[];
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
    sel_ind_A=[];sel_ind_B=[];ind_AB=[];ind_BA=[];
    for j=1:2:length(parents_loc)
        sel_ind_A(:,1) = parents(:,j);
        sel_ind_B(:,1) = parents(:,j+1);
        
        change_point=round((du_number-1)*rand+0.5);
        %% new individual AB
        for ii=1:change_point
            ind_AB(ii,1) =sel_ind_A(ii,1);
            ind_BA(ii,1) =sel_ind_B(ii,1);
        end
         %% new individual BA
        for ii=change_point+1:du_number
            ind_AB(ii,1) =sel_ind_B(ii,1);
            ind_BA(ii,1) =sel_ind_A(ii,1);
        end
        
        %% Creating kids
        kids(:,j)=ind_AB(:,1);
        kids_fitvalues(j) =FIT_function_flex(kids(:,j),components);
        
        kids(:,j+1) = ind_BA(:,1);
        kids_fitvalues(j+1) =FIT_function_flex(kids(:,j+1),components);
        
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
    for j=2:pop_size
        if components==2
   mutation_probability=mutation_probability^(1-i/number_of_generations);
         end
        GG=0;
        for ii =1:du_number
            ran_mut = rand;
            if ran_mut < mutation_probability
                gen_2_Duvalues(ii,j) =  NONuniMUTA(Dumax,Dumin,gen_2_Duvalues(ii,j),i,number_of_generations);
                GG=1;
            end
        end
        if GG==1
            gen_2_fitvalues(j)=FIT_function_flex(gen_2_Duvalues(:,j),components);
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
    
    
    %% STOP CRITIRION
    if stop_critirion==1
        if abs(max_fit_gen1-max_fit_gen2)/max_fit_gen2 <FITtol  && i<number_of_generations*0.9
            i_stop=i_stop+1;
        else
            i_stop=0;
        end
        if i_stop>STOP_SENS*(number_of_generations-i) && i<number_of_generations*0.9 && max_fit_gen2>minFITtarget
            i=round( number_of_generations*0.9);
        end
        if ll<7
            if i>number_of_generations*0.97 && (-max_fit_gen1+max_fit_gen2)/max_fit_gen2>FITtol*3
                number_of_generations=round(number_of_generations+number_of_generations*0.03);
                ll=ll+1;
            end
        end
    end
    
    if max_fit_gen1 >= max_fit_gen2
        max_fit_gen2 = max_fit_gen1;
        max_Du_gen2(:,1)= max_Du_gen1(:,1);
        gen_2_fitvalues(1) = max_fit_gen1;
        gen_2_Duvalues(:,1) =  max_Du_gen1(:,1);
        
    end
    %% fminsearch
    if hybrid==1
        if rem(i,clas_check)==0 
            
            du0(:,1)=max_Du_gen2(:,1);
            [du,fval] = myfminsearch(ff,du0,2000,2000);
             if (1/fval)>max_fit_gen2 %&& clas_fit< 1/fval
                gen_2_Duvalues(:,pop_size)=du(:);
                gen_2_fitvalues(pop_size) = 1/fval;
                clas_fit=1/fval;
            end
            if abs((max_fit_gen2-clas_fit)/max_fit_gen2)<0.01
                i_stop_clas=1+i_stop_clas;
            else
                i_stop_clas=0;
            end
            if i_stop_clas>STOP_SENS2*(number_of_generations-i) && minFITtarget<max_fit_gen2
                disp_matrix1=['stop by fminsearch solver at ',num2str(i),' generations'];
                disp(disp_matrix1)
                i=number_of_generations;
            end
        end
    end
    
    %Transform gen2 into gen1
    gen_1_Duvalues = gen_2_Duvalues;
    gen_1_fitvalues = gen_2_fitvalues;
    max_Du_gen1(:,1)= max_Du_gen2(:,1);
    max_fit_gen1 = max_fit_gen2;
    for ii=1:du_number
        All_generations_RESULTS(i,ii) = max_Du_gen2(ii,1);
    end
    All_generations_RESULTS(i,du_number+1) = max_fit_gen2;
    %Creating new fitness
    fitness = sum( gen_2_fitvalues);
    progress=i/number_of_generations*100;
    disp_matrix=['Progress status ',num2str(progress),'%'];
    disp(disp_matrix)
end
All_generations_RESULTS(number_of_generations,du_number+2) = toc;
FINALRES=All_generations_RESULTS(number_of_generations,du_number+1);
FINALRES2=All_generations_RESULTS(number_of_generations,1:du_number);
FINALRES3=All_generations_RESULTS(number_of_generations,du_number+2);

All_generations_RESULTS( ~any(All_generations_RESULTS,2), : ) = [];  %rows
disp_matrix2=['1/Q= ',num2str(FINALRES),' Duij= ',num2str(FINALRES2),'  Time(s)= ',num2str(FINALRES3)];
disp(disp_matrix2)
% %% GRAPH
% x=1:10000;
% y=All_generations_RESULTS(:,7);
% plot(x,y,'o')
%  legend('fit')



