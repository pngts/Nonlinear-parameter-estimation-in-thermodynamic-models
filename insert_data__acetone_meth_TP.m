clc;clear
% format long
global TK R gamma_exp X r q q1 gamma_cal
%% eisagogi dedomenwn 
components=2;
[TK,Pbar,Y1,X1] = importfile('ACET-1OL.DAT',3, 16);
id = [36 61]; % antoiine id
%TK=TK(1); % metrisis stin idia T 
T=TK-273.15; % se c
[names A B C] = AntoineGet(id);
Ps = 10.^(A - B./(T+C)); % DINEI mmHg kai c
Ps=0.0013332239*Ps ; % metatropi se bar
%% ipologismos piramatikwn gamma
gamma_exp=[];
X2 = 1-X1;              % calculate x2
X  = [X1  X2];         % create a 2 column array of x1 & x2
for i=1:length( X1 )
    gamma_exp(i,1)=Y1(i).*Pbar(i)./(X1(i).*Ps(i,1));
    gamma_exp(i,2)=(1-Y1(i)).*Pbar(i)./(X2(i).*Ps(i,2));
end
gamma_exp;
%% isagogi statherwn uniquac gia to dedomeno migma
R=1.9872;
r=[2.5735 1.4311];
q=[2.336 1.432] ;q1=q;
gamma_cal=[];
%----------------------



