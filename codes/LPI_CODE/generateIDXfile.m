function [ ] = generateIDXfile(param,names,addr)

idx = zeros(param.trainCnt,1);

file = load([names.prefix addr 'cluster_0' '.txt']);
minv = min(file(:,1));

for i=2:param.kmeans
    file = load([names.prefix addr 'cluster_' num2str(i-1) '.txt']);
    minv = min(min(file(:,1)),minv);  
end


for i=1:param.kmeans
    
    file = load([names.prefix addr 'cluster_' num2str(i-1) '.txt']);
    for j=1:size(file,1)
        
        a = file(j,1) - minv+1;
        idx(a) = i;
    end
end

saveFile =['save -ascii '  names.prefix addr names.file '_class' '.txt idx'];
eval(saveFile);


end

