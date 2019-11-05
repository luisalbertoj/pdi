function orgfi = dilatacion(f, c)
persistent lut
global B;
B = c;
if isempty(lut)
    lut = makelut(@dilatar,3);
end
orgfi = applylut(f, lut);

end
function value = dilatar(area)
global B;
[m, n] = size(B);
value = 0;
for i=1:m
    for j=1:n
        if(B(i,j))
         value = value || area(i,j);
        end
    end
end
end




