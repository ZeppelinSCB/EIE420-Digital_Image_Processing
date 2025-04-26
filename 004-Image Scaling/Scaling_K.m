%This function provides a image scaling algorithm.
% TODO: implement support for gray scale image
function [imScaled] = Scaling_K(imIn, scale, method)
    % Validate parameters
    dimensions = size(imIn);
    if scale <= 0
        error('Scale factor must be greater than 0.');
    end
    if method ~= ScaleMethod.nearest && method ~= ScaleMethod.bilinear
        error('Invalid method. Use 0 for Nearest Neighbor or 1 for Bilinear.');
    end
    % Note to use floor to avoid rounding error caused by floating point then cause index out of bound
    switch length(dimensions)
        case 2 
            imOut = zeros(floor(dimensions(1)*scale), floor(dimensions(2)*scale), "uint8");
        case 3
            imOut = zeros(floor(dimensions(1)*scale), floor(dimensions(2)*scale), dimensions(3), "uint8");
        otherwise
            error('Unsupported image format. Must be matrix with dimension of 2 or 3.');
    end
    % Perform scaling
    switch method
        case ScaleMethod.nearest
            imScaled = NN_K(imIn, imOut, scale);
        case ScaleMethod.bilinear
            imScaled = DL_K(imIn, imOut, scale);
        otherwise
            error('Invalid method. Use 0 for Nearest Neighbor or 1 for Bilinear.');
    end
end