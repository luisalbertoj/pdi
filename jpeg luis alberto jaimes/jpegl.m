function K = jpegl(f)
%Algoritmo de compresion JPEG
%   este algoritmo comprime una imagen 
%   para su uso primero lee una imagen en una matriz y pasala como
%   argumento f
imagen = f;
imagen1=imagen;
[row, coln]= size(imagen);
imagen= double(imagen);
%---------------------------------------------------------
% se le resta 128 a cada valor de la matriz de la imagen
%--------------------------------------------------------
imagen = imagen - (128*ones(row, coln));

quality = input('Que calidad quieres? :  ');

%----------------------------------------------------------
%  matriz de cuantificación
%----------------------------------------------------------
Q50 = [ 16 11 10 16 24 40 51 61;
     12 12 14 19 26 58 60 55;
     14 13 16 24 40 57 69 56;
     14 17 22 29 51 87 80 62; 
     18 22 37 56 68 109 103 77;
     24 35 55 64 81 104 113 92;
     49 64 78 87 103 121 120 101;
     72 92 95 98 112 100 103 99];
 
 if quality > 50
     QX = round(Q50.*(ones(8)*((100-quality)/50)));
     QX = uint8(QX);
 elseif quality < 50
     QX = round(Q50.*(ones(8)*(50/quality)));
     QX = uint8(QX);
 elseif quality == 50
     QX = Q50;
 end
 
DCT_matrix8 = dct(eye(8));
iDCT_matrix8 = DCT_matrix8';
dct_restored = zeros(row,coln);
QX = double(QX);
%----------------------------------------------------------
% Transformada discreta del coseno 
%----------------------------------------------------------

for i1=[1:8:row]
    for i2=[1:8:coln]
        zBLOCK=imagen(i1:i1+7,i2:i2+7);
        win1=DCT_matrix8*zBLOCK*iDCT_matrix8;
        dct_domain(i1:i1+7,i2:i2+7)=win1;
    end
end
%-----------------------------------------------------------
% Cuantización 
%-----------------------------------------------------------
for i1=[1:8:row]
    for i2=[1:8:coln]
        win1 = dct_domain(i1:i1+7,i2:i2+7);
        win2=round(win1./QX);
        dct_quantized(i1:i1+7,i2:i2+7)=win2;
    end
end
for i1=[1:8:row]
    for i2=[1:8:coln]
        win2 = dct_quantized(i1:i1+7,i2:i2+7);
        win3 = win2.*QX;
        dct_dequantized(i1:i1+7,i2:i2+7) = win3;
    end
end
for i1=[1:8:row]
    for i2=[1:8:coln]
        win3 = dct_dequantized(i1:i1+7,i2:i2+7);
        win4=iDCT_matrix8*win3*DCT_matrix8;
        dct_restored(i1:i1+7,i2:i2+7)=win4;
    end
end
imagen2=dct_restored;
K=mat2gray(imagen2);
figure(1);imshow(imagen1);title('Imagen de entrada');
figure(2);imshow(K);title('Imagen de salida');
imwrite(K,'imagenfinal.jpeg','JPEG');
end

