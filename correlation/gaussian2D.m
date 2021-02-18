function g=gaussian2D(num,sigma,dist)
x=linspace(-dist,dist,num);
[X,Y]=meshgrid(x);
g=exp(-(X).^2./(2*sigma^2)).*exp(-(Y).^2./(2*sigma^2));
