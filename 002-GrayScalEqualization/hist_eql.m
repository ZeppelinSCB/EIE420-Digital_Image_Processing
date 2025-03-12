function imgEql = hist_eql(img)
    imgSize = size(img);
    dimation = length(imgSize);
    if dimation == 3 %Assume input is RGB format
        imgHSV = rgb2hsv(img);
        img8b = uint8(imgHSV(:,:,3).*255);%Convert double to uint8
    elseif dimation == 2 %If dimention is 2, Assume Grey image
        img8b = uint8(img);
    else
        error('Input image must be either a gray image or a RGB image');
    end

    hist = hist_int(img);
    % Cumilative Sum
    cdf = cumsum(hist);
    % Calculate CDF
    cdf = cdf/cdf(end);
    % Scale to 0-255
    cdfW = cdf * 255;
    % Apply the equalization
    grayEql = cdfW(img8b + 1);
    
    if dimation == 3
        imgHSV(:,:,3) = double(grayEql)/255;%apply the equalized image
        imgEql = hsv2rgb(imgHSV);%convert back to RGB
    elseif dimation == 2
        % Convert to uint8
        imgEql = uint8(grayEql);
    end
end