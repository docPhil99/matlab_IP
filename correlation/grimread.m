function b=grimread(filename, varargin)
%PMB 2015 Reads image and converts to grey scale and double precission.
%b=grimread(filename, ...). Additaional optional paramaters are past to
%imresize, eg grimread('test.png',[100 200]) will resize image to 100x200
[im,map]=imread(filename);
info=imfinfo(filename);
sz=size(im,3);
switch sz
    case 3
        im=rgb2gray(im);
    case 4
        im=rgb2gray(im(:,:,1:3)); %ingore alpha
    case 2 %it problably a tiff with an alpha
        im=im(:,:,1);
    case 1
         if strcmp(info.ColorType,'indexed')
             im=ind2gray(im,map);
             info.SamplesPerPixel=1;
         end
        %do nothing
    otherwise
        error('Unknown image type')
end

scale=2^(info.BitDepth/info.SamplesPerPixel);
b=double(im)/scale;

if ~isempty(varargin) %optional rescale
    b=imresize(b,varargin{:});
end