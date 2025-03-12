function imOut = GetColorCom(image)
[y,x,k]=size(image);
imOut = zeros(2*y,2*x,k,"uint8");
imOut(1:y,1:x,:)=image(:,:,:);
for i=1:k
    row = floorDiv(i,2);%number of rows, start from 0
    col = mod(i,2);%0 for even, 1 for odd
    imOut((1+row*y):((row+1)*y),(1+col*x):((col+1)*x),i)=image(:,:,i);
end
end