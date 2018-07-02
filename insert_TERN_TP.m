clc;clear
format long
global TK R gamma_exp X r q q1 gamma_cal Y
%% eisagogi dedomenwn 
components=3;
[TK,Pbar,Y1,X1,Y2,X2] = importfile1('TERNARY_revised.DAT',3, 41);
% AntoineTableBrowse.m   emfanizei tis statheres antoine
id = [37 63 44]; % antoiine id
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
R=1.9872;
r=[2.5735 1.4311 0.92];
q=[2.3360 1.432 1.4] ;q1=q;
gamma_cal=[];
%----------------------




