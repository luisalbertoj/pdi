function Bref = reflexion(b, x, y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[m,n] = size(b);
Bref = zeros(m,n);
Bref(x,y) = 1;
for i=1:x
    for z=1:n
        if(b(i,z))
            Bref(m-i+1, n-z+1) = 1;
        end
        
    end
end
for i=x:m
    for z=1:n
        if(b(i,z))
            Bref(m-i+1, n-z+1) = 1;
        end
        
    end
end
end

