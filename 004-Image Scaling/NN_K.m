% This function is for the nearest neighbor interpolation of an image.
function [imScaled] = NN_K(imIn, imOut, scale)
    imEnlarged = [
        imIn;
        imIn(end,:,:)
    ];
    imEnlarged = [
        imEnlarged, imEnlarged(:,end,:);
    ];
    imScaled = ones(size(imOut), "uint8");
    for row = 1:size(imOut, 1)
        for col = 1:size(imOut, 2)
            rOrg = round((row)/scale+0.5); %shift 1 row down to avoid 0 index
            cOrg = round((col)/scale+0.5); %shift 1 column down to avoid 0 index
            imScaled(row, col,:) = imEnlarged(rOrg,cOrg,:);
        end
    end
end