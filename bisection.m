function [x]=bisection(f,a,b)

for i=1:100
      if i==100
        x='No root in this interval.';
        fprintf('\n')
        break;
    end
    x=(a+b)/2;
    
    if abs(f(x))<0.01
        break
    end
    
  
    
    if f(x)*f(a)<0
        b=x;
    end
    
    if f(x)*f(a)>0
        a=x;
    end
    
    
end
end