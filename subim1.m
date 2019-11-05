function s=subim(f,rx0,cy0,rx1,cy1)
%SUBIM Extrae una subimagen de una matriz f
%SUBIM(f,rx0,cy0,rx1,cy1) El punto inicial de la subimagen sera (rx0,cy0) y
%el punto final (rx1,cy1). rx0 y rx1 son las filas. cy0, cy1 son las columnas 

%Se comprueba que tenga dos dimensiones
if ~ismatrix(f)
    error('Solo se aceptan matrices')
end

%Que la fila final no sea menor que la inicial. Lo mismo para la columna
if rx0>rx1 || cy0>cy1 || rx0<1 || rx1<1 || cy0<1 || cy1<1 || rx0>size(f,1) || rx1>size(f,1) || cy0>size(f,2) || cy1>size(f,2)     
    error('Subindices incorrectos')
end
m=rx1-rx0+1;%La cantidad de filas
n=cy1-cy0+1;%La cantidad de columnas
s=zeros(m,n);%Se inicializa la matriz

for r=rx0:1:rx1%Se recorre desde la fila inicial hasta la final
    i=r-rx0+1;%Se calcula la fila que corresponde a la submatriz
    for c=cy0:1:cy1%Se recorre desde la columna inical hasta la final
        j=c-cy0+1;%Se calcula la columna que corresponde a la submatriz
        s(i,j)=f(r,c);%Se copia el valor
    end
end

