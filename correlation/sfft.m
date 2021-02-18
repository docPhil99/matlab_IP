function b=sfft(varargin)
%Shifted fft by PMB. First input is 1d array to be ffted. 
%The second is optional zero padding
error(nargchk(1,2,nargin))
a=varargin{1};
if(nargin==2)
    c=zeros(1,varargin{2});
    c=impad(varargin{1},c);
    b=fftshift(fft(fftshift(c)));
else
    b=fftshift(fft(fftshift(a)));
end