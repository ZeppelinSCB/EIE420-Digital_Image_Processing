function his = hist_int(img)
    imgSize = size(img);
    dimation = length(imgSize);
    if dimation == 3 %Assume input is RGB format
        imgHSV = rgb2hsv(img);
        img16b = uint8(imgHSV(:,:,3).*255);
        imshow(img16b)
    elseif dimation == 2 %If dimention is 2, Assume Grey image
        img16b = uint8(img);
    else
        error('Input image must be either a gray image or a RGB image');
    end

    his = zeros(1,256);
    m = imgSize(1);
    n = imgSize(2);
    for i = 1:m
        for j = 1:n
            his(img16b(i,j)+1) = his(img16b(i,j)+1) + 1;
        end
    end
end