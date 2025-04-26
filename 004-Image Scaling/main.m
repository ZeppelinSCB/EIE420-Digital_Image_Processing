clc;
IMAGE = 'Yokosuka.jpg_0.05_BL.png';
FOLDER = 'work/';
PATH = append(FOLDER,IMAGE);
I = imread(PATH);
SCALE = 6.6
ISSAVE = 1;
ROW = 1;
COL = 3;

subplot(ROW,COL,1)
imshow(I);
axis on;
grid on;
title('Original Image');

ISNN = Scaling_K(I,SCALE,'nearest');
subplot(ROW,COL,2)
imshow(ISNN);
axis on;
grid on;
title('Scaled Image using NN');

ISBL = Scaling_K(I,SCALE,'bilinear');
subplot(ROW,COL,3)
imshow(ISBL);
axis on;
grid on;
title('Scaled Image using Bilinear');

if ISSAVE
    imwrite(ISNN, append(FOLDER,IMAGE,'_',string(SCALE),'_NN.png'));
    imwrite(ISBL, append(FOLDER,IMAGE,'_',string(SCALE),'_BL.png'));
end