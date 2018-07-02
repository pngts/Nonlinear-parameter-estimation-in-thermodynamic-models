function [gamma] = gamma_uniquac(x, r, q,du12,du21)
% This function calculates UNIQUAC activity coefficients for binary and multicomponent mixtures.
% Only one composition can be evaluated with each function call.
% x - mole fraction row vector, with n elements for an n-component mixture.
% r - volume row vector, with n elements, in the same component order as x.
% q1 - surface area row vectors, with n elements, in the same component order as x.
% du12,du21 fro ga model

% make sure no value x is exactly zero.
tau=ones(2);
R=1.9872;
tau(1) = exp(-du12/(TK*R));tau(2) = exp(-du21/(TK*R));
% normalization constants for volume and surface area using vector math
rsum = x*r';
qsum = x*q';
% calculate vectors of volume fraction and surface area
phi = x.*r./rsum;
theta = x.*q./qsum;
l=5*(r(:)-q(:))-(r(:)-1);
% calculate the ln of the combinatorial contribution, vector.
lngcomb(1) = log(phi(1)/x(1)) +5*q(1)*log(theta(1)/phi(1))+l(1)-phi(1)/x(1)*x*l'
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

% ver 1.02 4/19/13 added documentation.
% ver 1.01 added dimension checking for input arrays.