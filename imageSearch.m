firstFolderNumber = 1;
lastFolderNumber = 6;

queryPath = '/mnt/Data/taster/'

numFoldersToSearch = lastFolderNumber - firstFolderNumber + 1;
results = cell(numFoldersToSearch, 1);

loopCounter = 1;

for i = firstFolderNumber:lastFolderNumber

  searchPath = ['/mnt/Images/' num2str(i) '/']

  [q, r] = tester(queryPath, searchPath, @compareImagesGamma);
  results{loopCounter} = r;
  loopCounter = loopCounter + 1;
end

%[q, r] = tester('/mnt/Data/taster_den/', '/mnt/Data/sample_den/', @compareImagesGammaV2);
%[q, r] = tester('/mnt/Data/taster/', '/mnt/Images/4/', @compareImagesGammaV2);
