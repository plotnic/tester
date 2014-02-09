firstFolderNumber = 1;
lastFolderNumber = 10;

queryPath = '/mnt/Data/taster/'

numFoldersToSearch = lastFolderNumber - firstFolderNumber + 1;
results = cell(lastFolderNumber, 1);

loopCounter = 1;

for i = firstFolderNumber:lastFolderNumber

  searchPath = ['/mnt/Images/' num2str(i) '/']

  [q, r] = tester(queryPath, searchPath, @compareImagesGamma);
  results{loopCounter} = r;
  loopCounter = loopCounter + 1;
end