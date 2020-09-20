%% myUnsharpMasking: sharpen the image stored at given path
function [imageSharp] = myUnsharpMasking(path)
	load(path, "imageOrig");
	[m, n] = size(imageOrig);
	imageOrig = im2double(imageOrig);
	imshow(imageOrig);
	imageSharp = imageOrig;
end