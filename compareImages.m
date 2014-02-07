function [ result ] = compareImages(queryFileStruct, candidatFileStruct, comparator)
% perform processing of the candidate matrix
% executes file comparision
% result: binary 
% 0 - /true/ pictures are equal 
% 1 - /false/ pictures aren't equal

  if queryFileStruct.imgHeight > candidatFileStruct.imgHeight
    result = 0;
    return;
  end
  
  if queryFileStruct.imgWidth > candidatFileStruct.imgWidth
    result = 0;
    return;
  end  
  cropedCandidatFileMatrix  = candidatFileStruct.imgMatrix(1:queryFileStruct.imgHeight, 1:queryFileStruct.imgWidth, :);
  
  res = comparator(queryFileStruct.imgMatrix, cropedCandidatFileMatrix);
  
  result = res;

end

