clc;clear
% format long
global TK R gamma_exp X r q q1 gamma_cal
%% eisagogi dedomenwn 
components=2;
[TK,Pbar,Y1,X1] = importfile('1OL-H2O.DAT',3, 18); % orizoume kai apo pou mexri pou na diavasi
id = [2 44]; % antoiine id
TK=TK(1); % metrisis stin idia T 
T=TK(1)-273.15; % se c
[names A B C] = AntoineGet(id);
Ps = 10.^(A - B./(T+C)); % DINEI mmHg kai c
Ps=0.0013332239*Ps ; % metatropi se bar
%% ipologismos piramatikwn gamma
gamma_exp=[];
X2 = 1-X1;              % calculate x2
X  = [X1  X2];         % create a 2 column array of x1 & x2
for i=1:length( X1 )
    gamma_exp(i,1)=Y1(i).*Pbar(i)./(X1(i).*Ps(1));
    gamma_exp(i,2)=(1-Y1(i)).*Pbar(i)./(X2(i).*Ps(2));
end
gamma_exp;
%% isagogi statherwn uniquac gia to dedomeno migma
R=1.9872;
r=[1.4311 0.92];
q=[1.432 1.4] ;q1=q;
gamma_cal=[];
%----------------------



