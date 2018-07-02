
% syms xx y 
%f(x,y)= @(x,y)FIT_function_flexTP_meshgrid(x,y,components);
f=@(xx,y)FIT_function_flexTP_meshgrid(xx,y,components);
% ezsurf(f(xx,y), [-100, 100])
fsurf(f,[-2000 2000],'ShowContours','on')
title('chcl3_meth')
xlabel('du12');
ylabel('du21');
zlabel('fitness');
box on

% fmesh(f,[-500 1500])
% surfc(f)
% fcontour(f,[1200 1450 -300 -200])