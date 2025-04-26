function mapEdge = EdgeGradient(img)
    % Standardize input image
    imgSize = size(img);
    dimention = length(imgSize);
    if dimention == 3 % Assume RGB image
        imgHSV = rgb2hsv(img);
        img8b = uint8(imgHSV(:,:,3) * 255); % Convert double to uint8
    elseif dimention == 2 % Assume grayscale image
        img8b = uint8(img);
    else
        error('Input must be a three or two dimensional matrix');
    end
    % Enlarge the image to avoid boundary problems
    img8bE = zeros(imgSize(1)+2, imgSize(2)+2, "uint8");
    img8bE(2:end-1, 2:end-1) = img8b;
    
    % |f(x,y)-f(x+1,y)|
    dR = abs(img8bE(2:end-1, 2:end-1) - img8bE(3:end, 2:end-1)); % Right
    % |f(x,y)-f(x-1,y)|
    dL = abs(img8bE(2:end-1, 2:end-1) - img8bE(1:end-2, 2:end-1)); % Left
    % |f(x,y)-f(x,y+1)|
    dD = abs(img8bE(2:end-1, 2:end-1) - img8bE(2:end-1, 3:end)); % Down
    % |f(x,y)-f(x,y-1)|
    dU = abs(img8bE(2:end-1, 2:end-1) - img8bE(2:end-1, 1:end-2)); % Up

    mapEdge = max(max(dR, dL), max(dD, dU));
    mapEdge = im2uint8(mat2gray(mapEdge));
    mapEdge = 255-double(mapEdge);
    mapEdge = im2uint8(mat2gray(mapEdge));

end