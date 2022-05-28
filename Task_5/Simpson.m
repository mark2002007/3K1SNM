classdef Simpson
  properties(GetAccess = 'public', SetAccess = 'private')
    f;
    a;
    b;
    eps;
  endproperties
  methods(Access = 'public')
    function obj = Simpson(f, a, b)
      obj.f = f;
      obj.a = a;
      obj.b = b;
    endfunction
    function res = Interpolate(obj, n)
      if obj.a == obj.b
        res = 0;
      else
        h = (obj.b-obj.a)/n;
        xs = obj.a:h:obj.b;
        r1 = 1/2*obj.f(xs(1))
        r2 = sum(obj.f(xs(2:n)))
        r3 = 2*sum(obj.f((xs(1:n) + xs(2:n+1))/2))
        r4 = 1/2*obj.f(n+1)
        res = h/3*( r1+  r2+  r3+ r4);
      endif;
    endfunction
    function Q1 = InterpolateWithError(obj, eps)
      n = 1;
      Q1 = Interpolate(obj, n);
      Q2 = 0;
      while(abs(Q2 - Q1) > eps)
        n += 1;
        Q2 = Q1;
        Q1 = Interpolate(obj, n);
      endwhile
    endfunction
  endmethods
endclassdef
  
  
  