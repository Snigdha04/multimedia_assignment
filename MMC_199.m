clc;
close all;
clear all;
v=VideoReader('C:\Users\ritik\Desktop\vvc5.mp4');
numberOfFrames = v.NumberOfFrames;
display(numberOfFrames);
img1=read(v,10);
imshow(img1);
mean_lol=mean(reshape(img1, size(img1,1) * size(img1,2), size(img1,3)));
if (mean_lol(1)<128 && mean_lol(2)<128 && mean_lol(3)<128)
    for i=2000:numberOfFrames
        thisFrame = read(v, i);
        bw = im2bw(thisFrame, graythresh(thisFrame));
        [centers, radii] = imfindcircles(bw,[30 90],'ObjectPolarity','dark');
        imshow(bw);
        h = viscircles(centers,radii);
        pause(1);
    end
    break;
else
    for i=1:numberOfFrames
        thisFrame = read(v, i);
        grayImage = rgb2gray(thisFrame);
        [centers, radii] = imfindcircles(grayImage,[30 90],'ObjectPolarity','dark')
        imshow(grayImage);
        h = viscircles(centers,radii);
        pause(1);
    end
    break;
end
display(dist);

%bw = im2bw(framelol, graythresh(framelol));
%imshow(bw);
% d = imdistline;
% for frame = 1000:1010 
%  %Extract the frame from the movie structure.
% 		thisFrame = read(v, frame);
%         grayImage = rgb2gray(thisFrame);
%         [centers, radii] = imfindcircles(grayImage,[100 150],'ObjectPolarity','dark')
%         imshow(grayImage);
%         h = viscircles(centers,radii);
%         w=waitforbuttonpress;
% end