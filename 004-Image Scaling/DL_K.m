function [imScaled] = DL_K(imIn, imOut, scale)
    imScaled = zeros(size(imOut), "uint8");
    imEnlarged = [
        imIn(1,:,:);
        imIn;
        imIn(end,:,:)
    ];
    imEnlarged = [
        imEnlarged(:,1,:), imEnlarged, imEnlarged(:,end,:);
    ];
    for row = 1:size(imOut, 1)
        for col = 1:size(imOut, 2)
            rOrg = 1+row/scale;
            cOrg = 1+col/scale;
            x = (1-mod(cOrg, 1));
            y = (1-mod(rOrg, 1));
            %NE
            pixNE = imEnlarged(floor(rOrg),floor(cOrg),:).*x.*y;
            pixNW = imEnlarged(floor(rOrg),floor(cOrg)+1,:).*(1-x).*(y);
            pixSE = imEnlarged(floor(rOrg)+1,floor(cOrg),:).*(x).*(1-y);
            pixSW = imEnlarged(floor(rOrg)+1,floor(cOrg)+1,:).*(1-x).*(1-y);
            imScaled(row, col,:) = pixNE + pixNW + pixSE + pixSW;
        end
    end
end