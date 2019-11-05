function [NOTA, AND,OR, XOR] = operacionesCojuntos(A, B)
NOTA = nota(A);
AND = and(A,B);
OR = or(A,B);
XOR = xor(A,B);
end

function nta = nota(A)
    nta = ~A;
end

function an = and(A, B)
    an = A.*B;
end

function o = or(A,B)
    o = A+B == 2;
end

function xo = xor(A,B)
    xo = A+B == 0;
end

