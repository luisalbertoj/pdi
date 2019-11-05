function r = FPMAR(f,p,q,t)
%FPMAR calcula algo
%   Detailed explanation goes here
if mod(p,2)==0 || mod(q,2)==0
    error('El tamaño de la mascara no es impar')
end
g = zeros(size(f,1)+floor(p/2)*2,size(f,2)+floor(q/2)*2);
m = size(f,1);
n = size(f,2);
g((floor(p/2)+1):(floor(p/2)+m), (floor(q/2)+1):(floor(q/2)+n)) = f;
r=zeros(m,n);
for i=(floor(p/2)+1):size(f,1)+1
    for j=(floor(q/2)+1):size(f,2)+1
        a = g((i-floor(p/2)):(i+floor(p/2)),(j-floor(q/2)):(j+floor(q/2)));
        b = sort(a(:));
        c = mean(b(t+1:p*q-t));
        r(i-(floor(p/2)),j-(floor(q/2)))=round(c);
    end
end

end

