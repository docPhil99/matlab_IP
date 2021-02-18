function b=sfft2(varargin)
%Shifted fft by PMB. First input is 2d array to be ffted. 
%The second is optional zero padding
error(nargchk(1,3,nargin))
a=varargin{1};
if(nargin==2)
    c=zeros(varargin{2});
    c=impad(varargin{1},c);
    b=fftshift(fft2(fftshift(c)));
elseif(nargin==3)
    c=zeros(varargin{2},varargin{3});
    c=impad(varargin{1},c);    
    b=fftshift(fft2(fftshift(c)));
else
    b=fftshift(fft2(fftshift(a)));
end
    