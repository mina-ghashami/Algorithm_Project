function [] = evaluateGA(names, param, when)
    average_dist = zeros(param.kmeans,param.kmeans);
    
    for i=1:param.kmeans
        cluster1 = load([names.prefix  names.data '_' names.clusterName '_' num2str(i) '.txt']); 
        for j=i+1:param.kmeans
            cluster2 = load([names.prefix  names.data '_' names.clusterName '_' num2str(j) '.txt']); 
            for m=1:size(cluster1,1)
                for n=1:size(cluster2,1)
                    average_dist(i,j) = average_dist(i,j) + EuDist2(cluster1(m,:),cluster2(n,:));
                end
            end
            average_dist(i,j) = average_dist(i,j)/(size(cluster1,1) + size(cluster2,1)); 
            average_dist(j,i) = average_dist(i,j);
        end
    end
    
    saveF=['save -ascii ' names.prefix names.GA '_' when '.txt average_dist']; 
    eval(saveF);

end