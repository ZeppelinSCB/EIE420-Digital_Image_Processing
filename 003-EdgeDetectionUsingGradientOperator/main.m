clc;
IMAGE = 'Yuudachi_at_Beach';
FOLDER = 'work/';
PATH = append(FOLDER,IMAGE,'.jpg');
I = imread(PATH);

subplot(1,3,1)
imshow(I);
title('Original Image');

Edge1 = EdgeGradient(I);
subplot(1,3,2)
imshow(Edge1);
title('Edge Detection using Gradient Operator');

Edge11 = imbinarize(Edge1,245/255);
subplot(1,3,2)
imshow(Edge11);
imwrite(Edge11,append(FOLDER,IMAGE,'-Edge.jpg'));
title('Binarized Edge Detection using Gradient Operator');

imgHSV = rgb2hsv(I);
img8b = uint8(imgHSV(:,:,3) * 255); % Convert double to uint8
Edge2 = edge(img8b);
Edge2 = ~Edge2;
subplot(1,3,3)
imshow(Edge2);
title('Edge Detection using MATLAB Function');