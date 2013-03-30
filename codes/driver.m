function[] = driver(algo, dataset, class_labels, k, rd)
trainMatrix = load(dataset);
class = load(class_labels);
idx = kmeans(trainMatrix,k);

if(dataset == 'gisette')
    r = 20800;
    minpnt = 3;
elseif (dataset == 'madelon')
    r = 720;
    minpnt = 3;
elseif (dataset == 'olivetti')
    r = 1500;
    minpnt = 5;
else
    r = compute_distance(trainMatrix); 
    minpnt = 3;
end

if (algo == 'LPI')
    options = [];
    options.Metric='Euclidean';
    options.NeighborMode='KNN';
    options.k = k;
    options.ReducedDim = rd;
   
    weight = constructW(trainMatrix,options);    
    [eigvector, eigvalue] = LPP(weight, options, trainMatrix);
    train_reduced = trainMatrix*eigvector;
    idx2 = kmeans(train_reduced,k);
    
    'kmeans'
    'idx and class'
    evaluateACMI(class, idx);
    'idx and idx2'
    evaluateACMI(idx, idx2);
    'class and idx2'
    evaluateACMI(class, idx2);
    
    'rand index(idx,idx2)'
    RI(idx,idx2,size(trainMatrix,1));
    'rand index(class,idx)'
    RI(class,idx,size(trainMatrix,1));
    'rand index(class,idx2)'
    RI(class,idx2,size(trainMatrix,1));
    
    
    [idx,type] = dbscan(trainMatrix,minpnt,r);
    idx = idx';
    [idx2,type2] = dbscan(train_reduced,minpnt,r);
    idx2 = idx2';
    
    'dbscan'
    'idx and class'
    evaluateACMI(class, idx);
    'idx and idx2'
    evaluateACMI(idx, idx2);
    'class and idx2'
    evaluateACMI(class, idx2);
    
    'rand index(idx,idx2)'
    RI(idx,idx2,size(trainMatrix,1));
    'rand index(class,idx)'
    RI(class,idx,size(trainMatrix,1));
    'rand index(class,idx2)'
    RI(class,idx2,size(trainMatrix,1));
    
    
    
elseif (algo == 'LDA')
    [mappingX,mapping]=PCA(trainMatrix,rd);
    [train_reduced,train_sum]=fld(mappingX,class,rd,1);
    train_final=mappingX*train_reduced;
    train_reduced=train_final;
            idx2=kmeans(train_reduced,2);
        
        'kmeans'
        'idx and class'
        evaluateACMI(class, idx);
        'idx and idx2'
        evaluateACMI(idx, idx2);
        'class and idx2'
        evaluateACMI(class, idx2);

        'rand index(idx,idx2)'
        RI(idx,idx2,size(trainMatrix,1));
        'rand index(class,idx)'
        RI(class,idx,size(trainMatrix,1));
        'rand index(class,idx2)'
        RI(class,idx2,size(trainMatrix,1));


        [idx,type] = dbscan(trainMatrix,minpnt,r);
        idx = idx';
        [idx2,type2] = dbscan(train_reduced,minpnt,r);
        idx2 = idx2';

        'dbscan'
        'idx and class'
        evaluateACMI(class, idx);
        'idx and idx2'
        evaluateACMI(idx, idx2);
        'class and idx2'
        evaluateACMI(class, idx2);
    
        'rand index(idx,idx2)'
        RI(idx,idx2,size(trainMatrix,1));
        'rand index(class,idx)'
        RI(class,idx,size(trainMatrix,1));
        'rand index(class,idx2)'
        RI(class,idx2,size(trainMatrix,1));
    
    
elseif (algo == 'PCA')
    if(dataset == 'gisette') 
        run('gisetteDriver')
    elseif (dataset == 'madelon')
        run('madelonDriver')
    elseif (dataset == 'olivetti')
        run('olivettiDriver')
    elseif(dataset == 'mnist')
        run('mnistDriver')
    else
        [train_reduced,mapping]=PCA(trainMatrix,rd);
        idx2=kmeans(train_reduced,2);
        
        'kmeans'
        'idx and class'
        evaluateACMI(class, idx);
        'idx and idx2'
        evaluateACMI(idx, idx2);
        'class and idx2'
        evaluateACMI(class, idx2);

        'rand index(idx,idx2)'
        RI(idx,idx2,size(trainMatrix,1));
        'rand index(class,idx)'
        RI(class,idx,size(trainMatrix,1));
        'rand index(class,idx2)'
        RI(class,idx2,size(trainMatrix,1));


        [idx,type] = dbscan(trainMatrix,minpnt,r);
        idx = idx';
        [idx2,type2] = dbscan(train_reduced,minpnt,r);
        idx2 = idx2';

        'dbscan'
        'idx and class'
        evaluateACMI(class, idx);
        'idx and idx2'
        evaluateACMI(idx, idx2);
        'class and idx2'
        evaluateACMI(class, idx2);
    
        'rand index(idx,idx2)'
        RI(idx,idx2,size(trainMatrix,1));
        'rand index(class,idx)'
        RI(class,idx,size(trainMatrix,1));
        'rand index(class,idx2)'
        RI(class,idx2,size(trainMatrix,1));
    
    
    end   
end

end