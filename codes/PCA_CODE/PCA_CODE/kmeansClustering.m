function [count] = kmeansClustering(dataMatrix, param, names)
    idx = kmeans(dataMatrix ,param.kmeans); 
    % idx is a 1*n array containing cluster label of each data
    % now we know the class of each data point
    %saveFile =['save -ascii '  names.prefix 'classes' num2str(param.dataCnt) '_' num2str(param.kmeans) '.txt idx'];
    %eval(saveFile);
        
    file = zeros(param.kmeans,size(dataMatrix,1), param.dim);
    dataIds = zeros(param.kmeans,size(dataMatrix,1));
    counter = ones(param.kmeans,1);
    
    trainIds = [names.prefix 'trainIds' num2str(param.dataCnt) '_' num2str(param.testCnt) '.txt'];
    trainIdsFile = load(trainIds);
    
    for i=1:size(dataMatrix,1)
        j = idx(i);  %j = id of cluster
        a = counter(j);   %a = row number
        dataIds(j,a) = trainIdsFile(i); % age mikhay indexe data ha az tuye train matrix ro bezari , just write i. trainIdsFile(i) put ids from main matrix
        file(j,a,:) = dataMatrix(i,:);
        counter(j) = counter(j) + 1;
    end
      
    
    for i=1:param.kmeans
        for j=1:counter(i)-1
            realIndex(j) = dataIds(i,j);
        end
        saveF=['save -ascii ' names.prefix names.realIdxName names.partialName '_' num2str(i) '.txt realIndex']; % realIndex az tuye main matrix ast
        eval(saveF);
    end
   
       %dlmwrite('a.txt', file(1,:,:), ' ');
       
    for i=1:param.kmeans
        temp = zeros(counter(i)-1,param.dim);
        for j=1:counter(i)-1
            for k=1:param.dim
                temp(j,k) = file(i,j,k);
            end
        end
        saveFile =['save -ascii '  names.prefix  names.partitionName names.partialName '_' num2str(i) '.txt temp'];
        eval(saveFile);
    end
  count = param.kmeans;    
end
    
        