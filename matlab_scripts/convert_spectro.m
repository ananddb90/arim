function [rgb_spectrogram] = convert_spectro(S, trepr, frepr)

im = imag(S); % input [0-1] image
h = imagesc(trepr*1e6,frepr/1e6,abs(S)); % imagesc handle
cm = colormap(h.Parent); % get axes colormap
n = size(cm,1); % number of colors in colormap
c = linspace(h.Parent.CLim(1),h.Parent.CLim(2),n); % intensity range
ind = reshape(interp1(c,1:n,im(:),'nearest'),size(im)); % indexed image
rgb_spectrogram = ind2rgb(ind,cm); % rgb image

end

