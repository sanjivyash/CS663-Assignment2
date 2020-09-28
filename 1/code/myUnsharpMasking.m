%% myUnsharpMasking: sharpen the image stored at given path
function myUnsharpMasking(path, name, count)
	load(path, "imageOrig");
	imageOrig = im2double(imageOrig);
    W = 20; % window Size
    sigma_s=0;
    c=0;
	if(name=="lion")
        sigma_s=5;
        c=2.5;
    else
        sigma_s=7;
        c=3;
    end
    G1 = fspecial('gaussian',2*W+1,sigma_s);
    G1F = imfilter(imageOrig, G1);
    imageSharp = imageOrig + c*(imageOrig-G1F);
    count = count + 1;
    msg = "Sharpened Image for weight = " + c + " Sigma =" + sigma_s;
    disp(msg);
    if(name=="lion")
        imwrite(imageSharp, "../images/lion_crop$" + c +"$" +sigma_s + ".png")
    else
        imwrite(imageSharp, "../images/moon_crop$" + c +"$" +sigma_s + ".png")
    end

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