##classdef F
##  properties(Access = 'public')
##    s;
##    eps;
##  endproperties
##  methods(Access = 'public')
##    function obj = F(f, a, eps)
##      obj.s = Simpson(f, a, a);
##      obj.eps = eps
##    endfunction
##    function res = Calc(obj, x)
##      s.b = x;
##      res = obj.s.InterpolateWithError(eps)
##    endfunction
##  endmethods
##endclassdef