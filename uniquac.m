function [gamma] = uniquac(x, r, q, q1, tau)
% This function calculates UNIQUAC activity coefficients for binary and multicomponent mixtures.
% Only one composition can be evaluated with each function call.
% x - mole fraction row vector, with n elements for an n-component mixture.
% r - volume row vector, with n elements, in the same component order as x.
% q, q1 - surface area row vectors, with n elements, in the same component order as x.
% tau - is matrix of parmaters, tau = exp(-aij/T), should be n x n matrix with 1 on diagonals 

% make sure no value x is exactly zero.
x = x + 1E-50;
sizex = size(x);
if sizex(1) ~= 1
    fprintf('Composition vector x should be a single row vector, but has %d rows. \nErrors will result.\n',sizex(1))
end
if sizex(2) ~= size(r,2)
    fprintf('Composition vector x indicates %d components, but volume vector r indicates %d components. \nErrors will result.\n',sizex(2),size(r,2))
end
if sizex(2) ~= size(q,2)
    fprintf('Composition vector x indicates %d components, but area vector q indicates %d components. \nErrors will result.\n',sizex(2),size(q,2))
end
if sizex(2) ~= size(q1,2)
    fprintf('Composition vector x indicates %d components, but area vector q1 indicates %d components. \nErrors will result.\n',sizex(2),size(q1,2))
end
if size(tau,2)~= size(tau,1)
    fprintf('Energy matrix tau should be square, but shows %d columns and %d rows.\nErrors will result.\n',size(tau,1),size(tau,2))
end
if sizex(2) ~= size(tau,2)
    fprintf('Composition vector x indicates %d components, but energy matrix tau indicates %d components. \nErrors will result.\n',sizex(2),size(tau,2))
end
    

% normalization constants for volume and surface area using vector math
rsum = x*r';
qsum = x*q';
q1sum = x*q1';

% calculate vectors of volume fraction and surface area
phi = x.*r./rsum;
theta = x.*q./qsum;
theta1 = x.*q1/q1sum;
% calculate the ln of the combinatorial contribution, vector.
lngcomb = log(phi./x) + (1-phi./x)-5.*q.*(log(phi./theta)+(1-phi./theta));

% The residual part is broken into three terms
% term1 = sum.i(theta.i*tauij) calculated by matrix multiplication
term1 = theta1*tau;
% term2 is a temporary vector
term2 = theta1./term1;
% use matrix multiplication for term3, using term2
% term3 = sum.j(theta.j*tau.kj/sum.i(theta.i*tauij))
term3 = term2*tau';

% the total residual vector
lngresid = q1.*(1-log(term1)-term3);
% the vector of activity coefficients by combining combinitorial and
% residual parts.

gamma = exp(lngcomb+lngresid);
end
