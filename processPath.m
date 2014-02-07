function [ processedPath ] = processPath( path )
%remove file mask from the path and returns it
    lastSlashIndex = max(findstr(path, '/'));
    processedPath = path(1:lastSlashIndex);
end

