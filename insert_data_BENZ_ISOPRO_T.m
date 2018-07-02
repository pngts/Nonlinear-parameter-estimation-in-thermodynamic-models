clc;clear
% format long
global TK R gamma_exp X r q q1 gamma_cal
%% eisagogi dedomenwn 
components=2;
[TK,PmmHg,X1,Y1] = importfile_EXCEL('benz_propylAlcho','Sheet1',3,16); % orizoume kai apo pou mexri pou na diavasi
id = [64 65]; % antoiine id
% TK=TK1(1); % metrisis stin idia T 
T=TK-273.15; % se c
[names A B C] = AntoineGet(id);
for j=1:2
for i=1:length( X1 )
Ps(i,j) = exp((A(j) - B(j)/(TK(i)+C(j)))); % DINEI mmHg kai K
end
end
%Ps=0.0013332239*Ps ; % metatropi se bar
%% ipologismos piramatikwn gamma
gamma_exp=[];
X2 = 1-X1;              % calculate x2
X  = [X1  X2];         % create a 2 column array of x1 & x2
for i=1:length( X1 )
    gamma_exp(i,1)=Y1(i).*PmmHg(i)./(X1(i).*Ps(i,1));
    gamma_exp(i,2)=(1-Y1(i)).*PmmHg(i)./(X2(i).*Ps(i,2));
end
gamma_exp;
%% isagogi statherwn uniquac gia to dedomeno migma
R=1.9872;
r=[3.1878 2.7791];
q=[2.40 2.508] ;q1=q;
gamma_cal=[];
%----------------------



