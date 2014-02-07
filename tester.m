function [queries, searchResult] = tester(queryPath, searchPath, comparator)
%% descr
%tester challange 
%find the image using the rectangular cut of that image
%query is the piece of image to find the source file

        tic;
    %% initialization   
    queryFiles = dir(queryPath);
    searchList = dir(searchPath);
    queryAmount = numel(queryFiles);
  
    searchResult = cell(0);
    
    queries = cell(0);
    
    %% file paths processing (removing file masks if assigned)
    queryPathFoldersOnly = processPath(queryPath);
    searchPathFoldersOnly = processPath(searchPath);
  
    %% queries processing
    for queryNumber = 1:queryAmount
        % skip if folder
        if (queryFiles(queryNumber).isdir == 1)
           continue; 
        end
        
        queries{end+1} = getImgStruct(queryPathFoldersOnly, queryFiles(queryNumber));
        
        searchResult{end+1} = cell(0);
    end 
    
    queryAmount = numel(queries);
    
    %% queries performing
    for fileNum = 1:numel(searchList)
        % skip if folder
        if (searchList(fileNum).isdir == 1)
            continue;  
        end 
        
        testingFile = getImgStruct(searchPathFoldersOnly, searchList(fileNum));

        for queryNumber = 1:queryAmount
            if compareImages(queries{queryNumber}, testingFile, comparator) == 1
                searchResult{queryNumber}{end+1} = testingFile;
            end   
        end
    end
        toc;
 end
