%%myBilateral Filter: Applies Bilateral filter on the noisy image
function myBilateralFilter(img, name)
    if(name=='grass')
        grass(img);
    elseif(name=='honey')
        honey(img);
    else
        barbara(img);
    end
end    

function grass(img)
    img = im2double(img);
    [m, n] = size(img);
    noisyImg = img + randn([m,n])*5/100;
    W = 20; %Window parameter, usually be chose to 5*sigma_s
    count=0;
    msg="For Grass Optimal sigma_s is 0.8 and Optimal sigma_i is 0.18"
    for sigma_s= [0.8, 0.72, 0.88]
        for sigma_i= [0.18, 0.162, 0.198]
            if(sigma_s==0.8 && sigma_i ==0.18 || sigma_s==0.72 && sigma_i ==0.18 || sigma_s==0.88 && sigma_i ==0.18 || sigma_s==0.8 && sigma_i ==0.162 || sigma_s==0.8 && sigma_i ==0.198)
                filteredImg = zeros([m,n]);
                [X,Y] = meshgrid(-W:W,-W:W);
                G_space = exp(-(X.^2+Y.^2)/(2*sigma_s^2));


                for i = 1:m
                    for j = 1:n
                        xmin = max(1, i-W);
                        xmax = min(m, i+W);
                        ymin = max(1, j-W);
                        ymax = min(n, j+W);

                        I = noisyImg(xmin:xmax, ymin:ymax);

                        G_intensity = exp(-(I-noisyImg(i,j)).^2/(2*sigma_i^2));

                        F = G_intensity.*G_space((xmin:xmax)-i+W+1,(ymin:ymax)-j+W+1);
                        filteredImg(i,j) = sum(F(:).*I(:))/sum(F(:));
                    end
                end
                count=count+1;
                %Plotting and writing the Filtered image
                RMSD = 1/m*(sqrt(sum((img-filteredImg).^2, 'all')));
                msg= "RMSD for Grass for sigma_s = " + sigma_s + " sigma_i = " + sigma_i + " is " + RMSD
                imwrite(filteredImg, "../images/grass$" + sigma_s +"$$" +sigma_i+ ".png")
                figure(count)
                title("RMSD = "+ RMSD)
                subplot(1,3,1), imshow(img);
                colorbar
                axis on
                title("Original Image")
                subplot(1,3,2), imshow(noisyImg);
                colorbar
                axis on
                title("Image with random Gaussian noise")
                subplot(1,3,3), imshow(filteredImg);
                colorbar
                axis on
                title("Bilateral Filter Output for \sigma_s = " + sigma_s + "\sigma_i = "+ sigma_i);
            end
        end
    end
end

function barbara(img)
    img = im2double(img);
    img=img/255;
    [m, n] = size(img);
    count=6;
    noisyImg = img + randn([m,n])*(max(img(:)) - min(img(:)))*5/100;
    W = 20; %Window parameter, usually be chose to 5*sigma_s
    msg=" For Barbara Optimal sigma_s is 0.9 and Optimal sigma_i is 0.05" 
    for sigma_s= [0.9, 0.81, 0.99]
        for sigma_i= [0.05, 0.045, 0.055]
            if(sigma_s==0.9 && sigma_i ==0.05 || sigma_s==0.9 && sigma_i ==0.045 || sigma_s==0.9 && sigma_i ==0.055 || sigma_s==0.81 && sigma_i ==0.05 || sigma_s==0.99 && sigma_i ==0.05)
                filteredImg = zeros([m,n]);
                [X,Y] = meshgrid(-W:W,-W:W);
                G_space = exp(-(X.^2+Y.^2)/(2*sigma_s^2));


                for i = 1:m
                    for j = 1:n
                        xmin = max(1, i-W);
                        xmax = min(m, i+W);
                        ymin = max(1, j-W);
                        ymax = min(n, j+W);

                        I = noisyImg(xmin:xmax, ymin:ymax);

                        G_intensity = exp(-(I-noisyImg(i,j)).^2/(2*sigma_i^2));

                        F = G_intensity.*G_space((xmin:xmax)-i+W+1,(ymin:ymax)-j+W+1);
                        filteredImg(i,j) = sum(F(:).*I(:))/sum(F(:));
                    end
                end

                count=count+1;
                %Plotting and writing the Filtered image
                RMSD = 1/m*(sqrt(sum((img-filteredImg).^2, 'all')));
                msg= "RMSD for Barbara for sigma_s = " + sigma_s + " sigma_i = " + sigma_i + " is " + RMSD
                imwrite(filteredImg, "../images/barbara$" + sigma_s +"$$" +sigma_i+ ".png")
                figure(count)
                title("RMSD = "+ RMSD)
                subplot(1,3,1), imshow(img);
                colorbar
                axis on
                title("Original Image")
                subplot(1,3,2), imshow(noisyImg);
                colorbar
                axis on
                title("Image with random Gaussian noise")
                subplot(1,3,3), imshow(filteredImg);
                colorbar
                axis on
                title("Bilateral Filter Output for \sigma_s = " + sigma_s + "\sigma_i = "+ sigma_i);
            end
        end
    end
end

function honey(img)
    img = im2double(img);
    [m, n] = size(img);
    count=11;
    noisyImg = img + randn([m,n])*5/100;
    W = 20; %Window parameter, usually be chose to 5*sigma_s
    msg="For HoneyComb Optimal sigma_s is 0.95 and Optimal sigma_i is 0.15"
    for sigma_s= [0.95, 0.855, 1.045]
        for sigma_i= [0.15, 0.135, 0.165]
            if(sigma_s==0.95 && sigma_i ==0.15 || sigma_s==0.855 && sigma_i ==0.15 || sigma_s==1.045 && sigma_i ==0.15 || sigma_s==0.95 && sigma_i ==0.135 || sigma_s==0.95 && sigma_i ==0.165)
                filteredImg = zeros([m,n]);
                [X,Y] = meshgrid(-W:W,-W:W);
                G_space = exp(-(X.^2+Y.^2)/(2*sigma_s^2));


                for i = 1:m
                    for j = 1:n
                        xmin = max(1, i-W);
                        xmax = min(m, i+W);
                        ymin = max(1, j-W);
                        ymax = min(n, j+W);

                        I = noisyImg(xmin:xmax, ymin:ymax);

                        G_intensity = exp(-(I-noisyImg(i,j)).^2/(2*sigma_i^2));

                        F = G_intensity.*G_space((xmin:xmax)-i+W+1,(ymin:ymax)-j+W+1);
                        filteredImg(i,j) = sum(F(:).*I(:))/sum(F(:));
                    end
                end

                count=count+1;
                %Plotting and writing the Filtered image
                RMSD = 1/m*(sqrt(sum((img-filteredImg).^2, 'all')));
                msg= "RMSD for HoneyComb for sigma_s = " + sigma_s + " sigma_i = " + sigma_i + " is " + RMSD
                imwrite(filteredImg, "../images/honeycomb$" + sigma_s +"$$" +sigma_i+ ".png")
                figure(count)
                title("RMSD = "+ RMSD)
                subplot(1,3,1), imshow(img);
                colorbar
                axis on
                title("Original Image")
                subplot(1,3,2), imshow(noisyImg);
                colorbar
                axis on
                title("Image with random Gaussian noise")
                subplot(1,3,3), imshow(filteredImg);
                colorbar
                axis on
                title("Bilateral Filter Output for \sigma_s = " + sigma_s + "\sigma_i = "+ sigma_i);
            end
        end
    end
end
    
