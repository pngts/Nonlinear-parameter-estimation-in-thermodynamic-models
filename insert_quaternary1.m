clc;clear
format long
global TK R gamma_exp X r q q1 gamma_cal Y 
%% eisagogi dedomenwn 
components=4;
% [TK,PmmHg,X1,X2,X3,Y1,Y2,Y3,gamma_exp1] = importfile_QUAD_EXCEL('quaternary1_?.xlsx','Sheet1',4,37);
IMPORT_QUERN_WITH_GAMMA
id = [39 3 44 47];% antoiine id
% TK=TK(1); % metrisis stin idia T  
T=TK-273.15; % se c
[names A B C] = AntoineGet(id);
Ps = 10.^(A - B./(T+C)); % DINEI mmHg kai c
% Ps=0.0013332239*Ps ; % metatropi se bar
%% ipologismos piramatikwn gamma
gamma_exp=[];
X4 = 1-X1-X2-X3;  Y4=1-Y1-Y2-Y3;            % calculate x3
X  = [X1 X2 X3 X4]; Y=[Y1 Y2 Y3 Y4]; % create column array of x1 & x2 & X3
% for i=1:length( X1 )
%     for k=1:components
     gamma_exp=[gamma_exp1 gamma_exp2 gamma_exp3 gamma_exp4];
%      gamma_exp(i,k)=Y(i,k).*Pbar(i)./(X(i,k).*Ps(i,k));
%     end
% end
gamma_exp;
%% isagogi statherwn uniquac gia to dedomeno migma
R=1.98721;
r=[3.48 2.10550 0.92000 1.90];
q=[3.12 1.97200 1.40000 1.80]; q1=q;
gamma_cal=[];
%----------------------
 


