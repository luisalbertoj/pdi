function [g,cont_ori,cont_ecua,h,cont_estira] = ecualizacion()
%ecualizacion mejora el constraste de una imagen a traves del metodo de
%ecualizacion del histograma. Tambien se mejora a traves del
%estiramiento con una funcion propia.
%g es la matriz producida por el metodo de ecualizacion, h es la matriz
%prouducida por el estiramiento. cont_ori, cont_ecua, cont_estira son los
%contrastes de: la imagen original, la producida por la ecualizacion y
%la producida por el estiramiento respectivamente.

close all
f=imread('mejorar_contraste.PNG');
f=rgb2gray(f);
[n,m]=size(f);
pixeles=0:255;
pixeles=pixeles*0;
frec=pixeles;%frecuencia de cada nivel de intensidad(0:255)
for i=1:n
    for j=1:m
        frec((f(i,j)+1))=frec((f(i,j)+1))+1;
        if f(i,j) ~= 255
            t=double(f(i,j)+1);
            pixeles(t:256)=pixeles(t:256)+1;
        end
    end
end

pixeles=round(pixeles*(255/(m*n)));
g=uint8(zeros(n,m));
for i=1:n
    for j=1:m
        g(i,j)=pixeles(f(i,j)+1);
    end
end
%calculo del contraste de la imagen original
promedio=sum(f(:))/(m*n);
probabilidad=frec/(m*n);
vec=0:255;
aux=((vec-promedio).^2).*probabilidad;
cont_ori=sum(aux).^(0.5);
disp(cont_ori);

%calculo de las frecuencias de los niveles de intensidad de la imagen
%producida por la ecualizacion
pixeles=pixeles*0;
for i=1:n
    for j=1:m
        pixeles((g(i,j)+1))=pixeles((g(i,j)+1))+1;
    end
end

%rango de valores originales a cambiar
a=0;
b=50;
%rango de valores destino
c=0;
d=255;

%calculo del contraste de la imagen producida de la ecualizacion
promedio=sum(g(:))/(m*n);
probabilidad=pixeles/(m*n);
aux=((vec-promedio).^2).*probabilidad;
cont_ecua=sum(aux).^(0.5);

%precalculo aplicando los valores de estiramiento de la imagen
valores_precalculados=0:255;
valores_precalculados((a+1):(b+1))=round(((d-c)/(b-a))*valores_precalculados((a+1):(b+1))-((d-c)/(b-a))*a)+c;
h=uint8(zeros(n,m));%matriz producida por estiramiento de la imagen
%reemplazo en la imagen por su valor correspondiente 
for i=1:n
    for j=1:m
        h(i,j)=uint8(valores_precalculados(f(i,j)+1));
    end
end

%calculo de las frecuencias de los niveles de intensidad de la imagen
%producida por el estiramiento
pixeles=pixeles*0;
for i=1:n
    for j=1:m
        pixeles((h(i,j)+1))=pixeles((h(i,j)+1))+1;
    end
end
%calculo del contraste de la imagen producida por el estiramiento
promedio=sum(h(:))/(m*n);
probabilidad=pixeles/(m*n);
aux=((vec-promedio).^2).*probabilidad;
cont_estira=sum(aux).^(0.5);
figure, imhist(f), figure, imhist(g), figure, imhist(h);
figure, imshow(f), figure, imshow(g), figure, imshow(h);