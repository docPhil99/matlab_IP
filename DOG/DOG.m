clear %clear all varibles
close all %close all figure windows

I=imread('building.tif');
figure(1)
imshow(I);
%create DOG (in frequency domain)
sigma=3;
DOGf=gaussian2D(601,sigma,10)-gaussian2D(601,sigma/1.6,10);
%display DOG
figure(2)
surfl(DOGf),shading interp, axis tight,title('DOG filter')
%convolve using FFT method
FI=sfft2(I);
CONV=FI.*DOGf;
fi=fftshift(ifft2(fftshift(CONV)));
%display
figure(3);
imagesc(abs(fi)),colormap('gray')



