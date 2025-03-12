clc;
IMAGE = "Anon.jpg";
FOLDER = "work/";
PATH = append(FOLDER,IMAGE);
Start = [193, 709];

iSource = imread(PATH);
[r,c,k] = size(iSource);
subplot(1,3,1);
imshow(iSource);
title('Original Image');
axis on;

imgSplit = GetColorCom(iSource);
subplot(1,3,2)
imshow(imgSplit)
title('Channel Split Image');
axis on;

imgCut = GetSubImage(iSource,[200 700],[600 1100]);
subplot(1,3,3);
imshow(imgCut);
title('Image Segment');
axis on;

impixelinfo;