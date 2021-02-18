%display DOG filtered images with a set of different values of sigma
clear
close all
I=imread('building.tif');
figure(1)
imshow(I);
sc=linspace(0.2,4,12);
for p=1:length(sc)

sigma=sc(p);
DOGf=gaussian2D(601,sigma,10)-gaussian2D(601,sigma/1.6,10);
figure(2)
surfl(DOGf),shading interp, axis tight,title('DOG filter')
FI=sfft2(I);
CONV=FI.*DOGf;
fi=fftshift(ifft2(fftshift(CONV)));
figure(3);
imagesc(abs(fi)),colormap('gray')

figure(4)
subplot(3,4,p)

imagesc(abs(fi)),colormap('gray')
title(sprintf('Sigma %f',sigma))
end
