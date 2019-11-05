function CIERRE = cierre(A, B)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

CIERRE = (erosion(dilatacion(A,B),B));

end

