function [ result ] = compareImagesGamma(image1, image2)
% compares two images as two matrix
% the images could differ with power (gamma correction) 
% result: binary 
% 1- /true/ pictures are equal 
% 0 - /false/ pictures aren't equal
    numberOfPairsToCheck = 33; % for 3 channels ( RGB )
    numChannels = 3;

    result = 1;
       
     try
        % assuming we are working with 3-channel images only
        maxHeight = size(image1, 1); 
        maxWidth = size(image1, 2);
        
        channelMeansImg1 = zeros(numChannels, 1);
        channelMeansImg2 = zeros(numChannels, 1);
        
        for i = 1:numChannels
            channelMeansImg1(i) = median(median(image1(:, :, i)));
            channelMeansImg2(i) = median(median(image2(:, :, i)));
        end
        
        for i = 1:numberOfPairsToCheck
            x = randi(maxHeight);
            y = randi(maxWidth);
            
            for j = 1:numChannels
                 img1Int = image1(x, y, j);
                 img2Int = image2(x, y, j);
                
                if (image1(x, y, j) > channelMeansImg1(j) && image2(x, y, j) <= channelMeansImg2(j)) || ...
                    (image1(x, y, j) < channelMeansImg1(j) && image2(x, y, j) >= channelMeansImg2(j))    
                   
                    result = 0;
                    return;
                end
            end
        end
    catch
        result = 0;
        disp('Warring: Incorrect image comparition occured');       
    end
end
