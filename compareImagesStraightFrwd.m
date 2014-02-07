function [ result ] = compareImagesStraightFrwd(image1, image2)
% compares two images as two matrix
% result: binary 
% 0 - /true/ pictures are equal 
% 1 - /false/ pictures aren't equal

    if (image1 == image2) 
        result = 1;
    else 
        result = 0;
    end
end

