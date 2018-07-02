function [fitness]=FIT_function_flexTP(du,components)
global TK R gamma_exp X r q q1 gamma_cal 

switch components
    case 4
        du12=du(1); du13=du(2); du14=du(3); du21=du(4);du23=du(5);du24=du(6);du31=du(7);du32=du(8);du34=du(9);du41=du(10);du42=du(11);du43=du(12);
        error=0;error1=0;
        for i=1:length(X)
            tau=[1 exp(-du12./TK(i)/R) exp(-du13./TK(i)/R) exp(-du14./TK(i)/R);exp(-du21./TK(i)/R) 1 exp(-du23./TK(i)/R) exp(-du24./TK(i)/R);exp(-du31./TK(i)/R) exp(-du32./TK(i)/R) 1 exp(-du34./TK(i)/R);exp(-du41./TK(i)/R) exp(-du42./TK(i)/R)  exp(-du43./TK(i)/R) 1] ;
            x=[X(i,1) X(i,2) X(i,3) X(i,4)];
            gamma_cal(i,:)=uniquac(x, r, q, q1,tau);
            error=error1 +((gamma_cal(i,1)-gamma_exp(i,1))/gamma_exp(i,1))^2 +((gamma_cal(i,2)-gamma_exp(i,2))/gamma_exp(i,2))^2 +((gamma_cal(i,3)-gamma_exp(i,3))/gamma_exp(i,3))^2+((gamma_cal(i,4)-gamma_exp(i,4))/gamma_exp(i,4))^2;
            error1=error;
        end
    case 3
        du12=du(1); du13=du(2); du21=du(3);du23=du(4);du31=du(5);du32=du(6);
        error=0;error1=0;
        for i=1:length(X)
            tau=[1 exp(-du12./TK(i)/R) exp(-du13./TK(i)/R);exp(-du21./TK(i)/R) 1 exp(-du23./TK(i)/R);exp(-du31./TK(i)/R) exp(-du32./TK(i)/R) 1] ;
            x=[X(i,1) X(i,2) X(i,3)];
            gamma_cal(i,:)=uniquac(x, r, q, q1,tau);
            error=error1 +((gamma_cal(i,1)-gamma_exp(i,1))/gamma_exp(i,1))^2 +((gamma_cal(i,2)-gamma_exp(i,2))/gamma_exp(i,2))^2 +((gamma_cal(i,3)-gamma_exp(i,3))/gamma_exp(i,3))^2;
            error1=error;
        end
    case 2
        du12=du(1); du21=du(2);
        error=0;error1=0;
        for i=1:length(X)
            tau=[1 exp(-du12./TK(i)/R);exp(-du21./TK(i)/R) 1 ] ;
            x=[X(i,1) X(i,2)];
            gamma_cal(i,:)=uniquac(x, r, q, q1,tau);
            error=error1 +((gamma_cal(i,1)-gamma_exp(i,1))/gamma_exp(i,1))^2 +((gamma_cal(i,2)-gamma_exp(i,2))/gamma_exp(i,2))^2;
            error1=error;
        end
        
end
fitness=1/error;