function APERTURA = apertura(A, B)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

APERTURA = (dilatacion(erosion(A, B), B));

end

