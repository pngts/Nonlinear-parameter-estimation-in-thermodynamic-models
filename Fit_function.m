function [fitness]=Fit_function(du12,du21)
global TK R gamma_exp X r q q1 gamma_cal
%% prota ipologizonte to gammaCalc apo tin uniquac
%du12=-362.3272; du21=139.1319;
%du12=-359.6; du21=575.49;
%du12=-585.41; du21=1065.404;
%du12=493.2754; du21=-131.5598;

tau=[1 exp(-du12./TK./R);exp(-du21./TK./R) 1 ] ;
error=0;error1=0;
for i=1:length(X)
x=[X(i,1) X(i,2)];
gamma_cal(i,:)=uniquac(x, r, q, q1,tau);
error=error1 +((gamma_cal(i,1)-gamma_exp(i,1))/gamma_exp(i,1))^2 +((gamma_cal(i,2)-gamma_exp(i,2))/gamma_exp(i,2))^2;
error1=error;
end 
fitness=1/error;