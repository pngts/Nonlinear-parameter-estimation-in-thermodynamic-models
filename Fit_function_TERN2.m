function [fitness]=Fit_function_TERN2(du12,du13,du21,du23,du31,du32)
global TK R gamma_exp X r q q1 gamma_cal
%% prota ipologizonte to gammaCalc apo tin uniquac
%du12=-130.2535*1.9872;du13=-81.56071*1.9872;du21=-34.51268*1.9872;du23=-873.6794*1.9872;du31=179.9613*1.9872;du32=304.4958*1.9872;
%du12=-315.49*R;du13=378.93*R;du21=-228.24*R;du23=-52.15*R;du31=691.51*R;du32=-142.79*R;
% du12=892.176910603683;du13=493.755343490955;du21=-426.625512950253;du23=-425.872500366702;du31=34.5200694478557;du32=615.206598583084;

tau=[1 exp(-du12./TK./R) exp(-du13./TK./R);exp(-du21./TK./R) 1 exp(-du23./TK./R);exp(-du31./TK./R) exp(-du32./TK./R) 1] ;
error=0;error1=0;
for i=1:length(X)
x=[X(i,1) X(i,2) X(i,3)];
gamma_cal(i,:)=uniquac(x, r, q, q1,tau);
error=error1 +((gamma_cal(i,1)-gamma_exp(i,1))/gamma_exp(i,1))^2 +((gamma_cal(i,2)-gamma_exp(i,2))/gamma_exp(i,2))^2 +((gamma_cal(i,3)-gamma_exp(i,3))/gamma_exp(i,3))^2;
% error=error1 +abs(gamma_cal(i,1)-gamma_exp(i,1))+abs(gamma_cal(i,2)-gamma_exp(i,2))+abs(gamma_cal(i,3)-gamma_exp(i,3)) ;
error1=error;
end 
fitness=1/error;