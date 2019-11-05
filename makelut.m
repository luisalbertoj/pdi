function count = makelut(fun, dimension)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

lut = zeros(dimension, dimension);

count = 1; 

for w=1:dimension
    for z=1: dimension
        lut = zeros(dimension, dimension);
        lut(w,z)= 1;
        for i=2: dimension
            for j=2: dimension
                if i > 3
                    lut(i-1,j-1)= 0;
                end
                lut(i,j)= 1;
                fun(lut);
                count = count + 1;
            end
        end
    end
end
lut = zeros(dimension, dimension);
for w=dimension: -1: 1
    for z=1: dimension
        lut = zeros(dimension, dimension);
        lut(w,z)= 1;
        for i=dimension: -1: 1
            for j=dimension: -1: 1
                if i < dimension-2
                    lut(i-1,j-1)= 0;
                end
                lut(i,j)= 1;
                fun(lut);
                count = count + 1;
            end
        end
    end
end
lut = zeros(dimension, dimension);
for i=1: dimension
    for j=1: dimension
        lut(i,j)= 1;
        fun(lut);
        count = count + 1;
    end
end
lut = zeros(dimension, dimension);
for i=dimension:-1: 1
    for j=dimension:-1: 1
        lut(i,j)= 1;
        fun(lut);
        count = count + 1;
    end
end

end



