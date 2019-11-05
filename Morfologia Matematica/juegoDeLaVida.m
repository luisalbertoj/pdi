function orgfi = juegoDeLaVida(f, g)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
persistent lut

if isempty(lut)
    lut = makelut(@lifeOrDead,3);
end


for i=1:g
    orgfi = applylut(f,lut);
end

end
function LOD = lifeOrDead(generacion)
gen = sum(generacion(:)) - 1;
centro = generacion(2,2);
LOD = 0;
if((gen == 2 || gen == 3)&&centro)
    LOD = 1;
end
if((gen == 0 || gen == 1 || gen >= 4)&&centro)
    LOD = 1;
end
if(gen==3)
    LOD = 1;
end

end
