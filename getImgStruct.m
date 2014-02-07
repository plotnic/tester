function [ imgStruct ] = getImgStruct( path, file )
% returns an instance of the structure which used for image monipulating in tester.m 
    fileName = file.name;

    fileFullPath = [path fileName];

    try
        imgMatrix = imread(fileFullPath);
    catch
        imgMatrix = zeros(1,1);
        disp(['Warring: error while image reading occured']);
    end
    
    [imgHeight, imgWidth, ~] = size(imgMatrix);

    imgStruct = struct(...
        'fileName', fileFullPath, ...
        'imgMatrix', imgMatrix, ...
        'imgHeight', imgHeight, ...
        'imgWidth', imgWidth);
end

