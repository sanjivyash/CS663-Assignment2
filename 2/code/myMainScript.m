%% MyMainScript

tic;
%% Your code here
img = imread('../data/grass.png');
str="grass";
str3="honey";
str2="barbara";
load("../data/barbara.mat", "imageOrig");
img3 = imread('../data/honeyCombReal.png');
myBilateralFilter(img, str);
myBilateralFilter(img3, str3);
myBilateralFilter(imageOrig, "barbara");
toc;
