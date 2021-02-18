%rotate an image and peak height drops
clear
close all

a=grimread('a.tif');
b=imrotate(a,30,'crop');

A=sfft2(a); %sfft2 takes account of shifting pre and post fft.
B=sfft2(b);

figure(1)
subplot(2,2,1)
imshow(a)
subplot(2,2,2)
imshow(b)
subplot(2,2,3)
imagesc(abs(A));
subplot(2,2,4)
imagesc(abs(B))

C1=A.*conj(A);
C2=A.*conj(B);

c1=sfft2(C1);
c2=sfft2(C2);

figure(2)
subplot(2,2,1)
imagesc(abs(c1))
subplot(2,2,2)
imagesc(abs(c2))
subplot(2,2,3)
surfl(abs(c1)),shading interp, axis tight
subplot(2,2,4)
surfl(abs(c2)),shading interp, axis tight

