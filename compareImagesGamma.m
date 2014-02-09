function [ result ] = compareImagesGamma(image1, image2)
% compares two images as two matrix
% the images could differ with power (gamma correction) 
% result: binary 
% 0 - /true/ pictures are equal 
% 1 - /false/ pictures aren't equal

    try
        img1 = double(image1);
        img2 = double(image2);

        pixelPowers = log(img1)./log(img2);

        imgDimensionNumber = numel(size(img1));

        powerVariance = pixelPowers;

        for i = 1:imgDimensionNumber
            powerVariance = var(powerVariance);
        end 

        if (powerVariance == 0) 
            result = 1;
        else 
            result = 0;
        end
    catch
        result = 0;
        disp(['Warring: Incorrect matrix comparition occured']);
    end
end