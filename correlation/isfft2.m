function b=grimread(filename)
%PMB 2005 Reads image and converts to grey scale and double precission
im=imread(filename);
if(ndims(im)==3)
    im=rgb2gray(im);
end
b=double(im);