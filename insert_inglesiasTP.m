clc;clear
format long
global TK R gamma_exp X r q q1 gamma_cal Y
%% eisagogi dedomenwn 
components=3;
[TK,Pbar,X1,X2,Y1,Y2] = importfileTERN_excel('inglesias.xlsx','Sheet1',1,122);
id = [37 2 44]; % antoiine id
% TK=TK(1); % metrisis stin idia T  
T=TK-273.15; % se c
[names A B C] = AntoineGet(id);
Ps = 10.^(A - B./(T+C)); % DINEI mmHg kai c
Ps=0.0013332239*Ps ; % metatropi se bar
%% ipologismos piramatikwn gamma
gamma_exp=[];
X3 = 1-X1-X2;  Y3=1-Y1-Y2;            % calculate x3
X  = [X1 X2 X3]; Y=[Y1 Y2 Y3]; % create column array of x1 & x2 & X3
for i=1:length( X1 )
    for k=1:3
    gamma_exp(i,k)=Y(i,k).*Pbar(i)./(X(i,k).*Ps(i,k));
    end
end
gamma_exp;
%% isagogi statherwn uniquac gia to dedomeno migma
R=1.98721;
r=[2.5735 2.8675 1.4311];
q=[2.3360 2.4120 1.4320]; q1=q;
gamma_cal=[];
%----------------------
    



