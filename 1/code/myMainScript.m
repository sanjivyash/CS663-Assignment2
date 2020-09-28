%% MyMainScript

tic;
%% Your code here
str="lion";
str2="moon";
myUnsharpMasking("../data/lionCrop.mat", 'lion', 0);
myUnsharpMasking("../data/superMoonCrop.mat", "moon", 1);
toc;
