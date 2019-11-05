function s = subim(f,rx,cy, rx1, cy1)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


if rx<0||rx1<0||cy<0||cy1<0
    error('los valores no pueden ser negativos');
elseif rx>rx1||cy>cy1
    error('mm');
else
xcount=0;

m=rx-rx1+1;%La cantidad de filas
n=cy-cy1+1;%La cantidad de columnas
s = zeros(m, n);


for r=rx:rx1
    xcount=xcount+1;
    ycount=0;
    for c=cy:cy1
        ycount=ycount+1;
        s(xcount, ycount)=f(r,c);
    end
end
end
