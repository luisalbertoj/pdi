clc;

img = imread('lena.bmp');
% JPEG compression
jpegcompression(img,'lena_compressed.mat');
% JPEG decompression
Irec = jpegrestoration('lena_compressed.mat');

% System performances
[CR,BPP,PSNR,MSE,SNR] = systemperformances(img,Irec,'lena_compressed.mat');

% Plotting
figure,subplot(1,2,1),imshow(img),title('Original image'),...
    subplot(1,2,2),imshow(Irec),title('Decompressed image');

disp('Compression ratio:');
disp(CR);
disp('Bits per pixel:');
disp(BPP);
disp('Peak signal to noise ratio:');
disp(PSNR);
disp('Mean squared error:');
disp(MSE);
disp('Signal to noise ratio');
disp(SNR);


