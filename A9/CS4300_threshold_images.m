function [samples, target] = CS4300_threshold_images()
% CS4300_threshold_images - Gets images, thresholds them and creates a 
%   feature vector for each image
% On output:
%   samples (27x225): struct of feature vectors
%   target (27x1 vector): target vector
% Call:
%   samples = CS4300_threshold_images();
% Author:
%   Matthew Lemon
%   UU575787
%   Derek Heldt-Werle
%   UU828479
%   Fall 2016
%

samples = [];
target = [];

files = dir('images/*.jpg');
for i=1:length(files)
    im = imread(strcat('images/', files(i).name));
    im = imresize(im, [15,15]);
    im = im > 50;
    samples(i,:) = im(:);
end

for i=1:9
    target(i) = 1;
end
for i=10:18
    target(i) = 2;
end
for i=19:27
    target(i) = 3;
end

