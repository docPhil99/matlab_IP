 %1D correlation example.
clear

%close all

%% Generate test data
input=zeros(32,1);
%input(2)=1;
%input(3)=1;
%input=input+.2;
input(15:18)=1;
figure(1)
plot(input),title('input'),axis([1 32 0 1.1])
mask=zeros(32,1);
mask(10:13)=1;
pad_mask=[zeros(32,1); mask ;zeros(32,1)];
%pad_mask=pad_mask-mean(pad_mask(:));

%% perform correlation
figure(2)
plot(mask),title('mask'),axis([1 32 0 1.1])
figure(3)
for p=1:65
    sub_mask=pad_mask(p:p+31);
    subplot(2,1,1)
    plot(1:32,sub_mask,1:32,input),axis([1 32 0 max(input)*1.1])
    title('Input and Mask')
    corr(p)=sum(sub_mask.*input);
 %   corr(p)=corr(p)./(norm(sub_mask)*norm(input));
    subplot(2,1,2)
    plot(corr),axis([1 64 0 6])
    title('Output')
    drawnow
    pause(0.1)
end

return
%% The FT method
figure(4)
COR=sfft(sfft(input).*conj(sfft(mask)));
plot(abs(COR)),title('FT method');


