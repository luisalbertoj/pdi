function orgfi = ej(f)
persistent lut

if isempty(lut)
    lut = makelut(@ejercicio,3);
end
orgfi = applylut(f, lut);

end
function LOD = ejercicio(area)
LOD = area(1,2) & area(2,2) & area(3,3) & area(2,3) & ~area(1,1) & ~area(3,1);
end


