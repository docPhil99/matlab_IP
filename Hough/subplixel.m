figure(1),clf
x=linspace(-10,10,11);
sigma=3;
b=.2;
g=exp(-(x-b).^2./(2*sigma^2));
hold on,bar(x,g),plot(x,g),hold off;

res=sum(x.*g)/sum(g)

%add noise
g=g+randn(1,11)*.1;
figure(2),clf
hold on,bar(x,g),plot(x,g),hold off;

res=sum(x.*g)/sum(g)
