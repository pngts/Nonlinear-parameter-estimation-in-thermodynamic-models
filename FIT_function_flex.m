function [fitness]=FIT_function_flex(du,components)
global TK R gamma_exp X r q q1 gamma_cal

switch components
    case 3
        du12=du(1); du13=du(2); du21=du(3);du23=du(4);du31=du(5);du32=du(6);
        tau=[1 exp(-du12./TK./R) exp(-du13./TK./R);exp(-du21./TK./R) 1 exp(-du23./TK./R);exp(-du31./TK./R) exp(-du32./TK./R) 1] ;
        error=0;error1=0;
        for i=1:length(X)
            x=[X(i,1) X(i,2) X(i,3)];
            gamma_cal(i,:)=uniquac(x, r, q, q1,tau);
            error=error1 +((gamma_cal(i,1)-gamma_exp(i,1))/gamma_exp(i,1))^2 +((gamma_cal(i,2)-gamma_exp(i,2))/gamma_exp(i,2))^2 +((gamma_cal(i,3)-gamma_exp(i,3))/gamma_exp(i,3))^2;
            % error=error1 +abs(gamma_cal(i,1)-gamma_exp(i,1))+abs(gamma_cal(i,2)-gamma_exp(i,2))+abs(gamma_cal(i,3)-gamma_exp(i,3)) ;
            error1=error;
        end
    case 2
        du12=du(1); du21=du(2);
        tau=[1 exp(-du12./TK./R);exp(-du21./TK./R) 1 ] ;
        error=0;error1=0;
        for i=1:length(X)
            x=[X(i,1) X(i,2)];
            gamma_cal(i,:)=uniquac(x, r, q, q1,tau);
            error=error1 +((gamma_cal(i,1)-gamma_exp(i,1))/gamma_exp(i,1))^2 +((gamma_cal(i,2)-gamma_exp(i,2))/gamma_exp(i,2))^2;
            error1=error;
        end
        
end
fitness=1/error;