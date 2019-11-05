function k = rellenar(f, x, y)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[m, n] = size(f);
if(f(x,y))
    error('El elemento no es un punto interior')
end
borde = 0;
k = zeros(m,n);

for i=1:m
    for w=1:n
        if(f(i,w))
            k(i,w) = 1;
        end        
    end
end



end

