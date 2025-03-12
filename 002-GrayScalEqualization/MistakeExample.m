clc; clear;
IMAGE = 'Ruri';
PATH = append(IMAGE,'.jpg');
I = imread(PATH);
subplot(2,2,1)
imshow(I);
title('Original Image');

subplot(2,2,3)
imgEql = hist_eql(I);
imshow(imgEql);
title('Correctly Equalized Image');

subplot(2,2,4)
rEql = hist_eql(imgEql(:,:,1));
gEql = hist_eql(imgEql(:,:,2));
bEql = hist_eql(imgEql(:,:,3));
distEql(:,:,1) = rEql;
distEql(:,:,2) = gEql;
distEql(:,:,3) = bEql;

imwrite(distEql,append(IMAGE,'-ERROR.jpg'));
imshow(distEql);
title('Incorrrectly Equalized Image');