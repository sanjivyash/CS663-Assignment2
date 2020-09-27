%% myUnsharpMasking: sharpen the image stored at given path
function [imageSharp] = myUnsharpMasking(path)
	load(path, "imageOrig");
	imageOrig = im2double(imageOrig);
	count = 0;
	W = 20; % window Size

	for c = 1.5:0.5:3
		for sigma_s = 4:1:8
			G1 = fspecial('gaussian', 2*W+1, sigma_s);
			G1F = imfilter(imageOrig, G1);
			imageSharp = imageOrig + c*(imageOrig - G1F);

			count = count + 1;
			msg = "Sharpened Image for weight = " + c + " Sigma =" + sigma_s
			imwrite(imageSharp, "../images/$" + c +"$" +sigma_s + ".png")

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
end
