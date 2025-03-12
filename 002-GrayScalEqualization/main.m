clc;
IMAGE = 'PlumBlossom';
FOLDER = 'work/';
PATH = append(FOLDER,IMAGE,'.jpg');
I = imread(PATH);
subplot(2,3,1)
imshow(I);
title('Original Image');

subplot(2,3,2)
title('Gray Scale of the Original');
gHist = hist_int(I);
subplot(2,3,3)
bar(gHist);
title('Histogram of Original Image');

% Equalization
subplot(2,3,4)
imgEql = hist_eql(I);
imshow(imgEql);
title('Equalized Image');
imwrite(imgEql,append(IMAGE,'-Eql.jpg'));
size(imgEql);

subplot(2,3,5)
title('Gray Scale of the Equalized');
eHist = hist_int(imgEql);
subplot(2,3,6)
bar(eHist);
title('Histogram of Equalized Image');