function orgfi = erosion(f, c)
persistent lut
global B;
B = c;
if isempty(lut)
    lut = makelut(@erosionar,3);
end
orgfi = applylut(f, lut);

end
function value = erosionar(area)
global B;
[m, n] = size(B);
value = 1;
for i=1:m
    for j=1:n
        if(B(i,j))
         value = value && area(i,j);
        end
    end
end

end

