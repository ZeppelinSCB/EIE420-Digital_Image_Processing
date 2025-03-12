function imOut = GetSubImage(varargin)
disp(length(varargin));
if(length(varargin)==5)
    imgIn=varargin{1};
    startR=varargin{2};
    startC=varargin{3};
    sizeR=varargin{4};
    sizeC=varargin{5};
    imOut = imgIn(startR:(startR+sizeR),startC:(startC+sizeC),:);
elseif(length(varargin)==3)
    imgIn=varargin{1};
    startR=varargin{2}(2);%Start(x,y)
    startC=varargin{2}(1);%Start(x,y)
    endR=varargin{3}(2);%Start(x,y)
    endC=varargin{3}(1);%Start(x,y)
    imOut = imgIn(startR:endR,startC:endC,:);
else
    display("Invalid Number of Inputs")
end
end