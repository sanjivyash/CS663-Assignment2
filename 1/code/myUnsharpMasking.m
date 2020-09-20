%% myUnsharpMasking: sharpen the image stored at given path
function [imageSharp] = myUnsharpMasking(path)
	load(path, "imageOrig");
	imageOrig = im2double(imageOrig);
	count = 0;

	kernel = [0 1 0; 1 -4 1; 0 1 0];
	identity = [0 0 0; 0 1 0; 0 0 0]; 

	for c = 1:0.5:3
		mat = (identity - c * kernel);
		imageSharp = convImage(imageOrig, mat);
		count = count + 1;
		msg = "Sharpened Image for weight = " + c
		imwrite(imageSharp, "../images/$" + c + ".png")

		%% plotting two images side by side
		figure(count)
		subplot(1,2,1), imshow(imageOrig);
		colorbar
		axis on
		title("Original Image")
		subplot(1,2,2), imshow(imageSharp);
		colorbar
		axis on
		title(msg);
	end
end


%% convImage: use a filter and convolve image
function [convImg] = convImage(img, mat)
	[m, n] = size(img);
	convImg = img;

	for i = 2:1:m-1 
		for j = 2:1:n-1
			product = img(i-1:1:i+1, j-1:1:j+1) .* mat;
			convImg(i, j) = sum(sum(product));  
		end 
	end
end
