function orgfi = pre(f)
persistent lut

if isempty(lut)
    lut = makelut(@dilatar,3);
end
orgfi = applylut(f, lut);
end
function LOD = dilatar(area)
LOD = (sum(area(:)) >= 3);

end

