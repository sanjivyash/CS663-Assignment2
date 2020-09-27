%% MyMainScript

tic;
%% Your code here
str="grass";
str2="barbara";
str3="honey";
img = imread('../data/grass.png');
load("../data/barbara.mat", "imageOrig");
img3 = imread('../data/honeyCombReal.png');
myBilateralFilter(img, str);
myBilateralFilter(imageOrig, str2);
myBilateralFilter(img3, str3);
toc;
