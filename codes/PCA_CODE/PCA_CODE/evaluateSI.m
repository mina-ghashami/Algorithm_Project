function [SI] = evaluateSI(names, param)
    centers = zeros(param.kmeans);
    
    for i=1:param.kmeans
        cluster = load([names.prefix  names.data '_' names.clusterName '_' num2str(i) '.txt']); 
        for j=1:size(cluster,1)
            centers(i) = centers(i) + cluster(j,:);
        end
        centers(i) = centers(i)/size(cluster,1);
    end
    
    dmin = EuDist2(centers(1),centers(2));
    for i=1:param.kmeans
        for j=i+1:param.kmeans
            d = EuDist2(centers(i),centers(j));
            if(d<dmin)
                dmin = d;
            end
        end
    end
    dmin = dmin^2;
    
    %soorate kasr
    d = 0;
    for i=1:param.kmeans
        cluster = load([names.prefix  names.data '_' names.clusterName '_' num2str(i) '.txt']); 
        for j=1:size(cluster,1)
            temp = EuDist2(centers(i),cluster(j,:));
            d = d + temp^2;
        end
    end
    
    SI = d/(param.trainCnt*dmin);

end