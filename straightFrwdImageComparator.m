function [ result ] = straightFrwdImageComparator(image1, image2)
% compares two images as two matrix
% result: binary 
% 0 - /true/ pictures are equal 
% 1 - /false/ pictures aren't equal
    try
        if (image1 == image2) 
            result = 1;
        else 
            result = 0;
        end
    catch
        result = 0;
        disp(['Warring: Incorrect matrix comparition occured']);
    end
end

