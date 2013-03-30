function[]= main()
load -ascii data\parameters.txt

param = [];
param.trainCnt = parameters(1); %train data
param.testCnt = parameters(2); %test data
param.validCnt = parameters(3); %valid data
param.rd = parameters(4);  % reduced dimension
param.knn = parameters(5); % for KNN 
param.kmeans = parameters(6);

%param.r = parameters(7); % for both partitioning and constructing weight matrix?


names=[];
names.prefix='data\';
names.file = 'gisette'; 
names.trainMatrixName='trainMatrix'; 
names.data='data';
names.clusterName = 'cluster';
% names.weightName='weight';
names.reduceParName='reducedPartition';
% names.reducetestname='reducedtestpartition';
names.ids='ids';
names.GA = 'GA';
names.before = 'before';
names.after = 'after';


options = [];
options.Metric='Euclidean';
options.NeighborMode='KNN';
options.k = param.knn;
options.ReducedDim=param.rd;


% trainMatrix = load([names.prefix names.file '_' 'train' '.data']); 
% param.dim = size(trainMatrix,2);
% trainIds = 1:6000;


% idx = kmeansClustering(trainMatrix, trainIds, param, names, names.before);
%evaluateGA(names, param, names.before);
%SI_before = evaluateSI(names, param)

% reducedMatrix = reduceByLPI(trainMatrix, names, options);
% 'afer reduce'
% reducedMatrix = load([names.prefix 'reduced_LPI_' num2str(options.ReducedDim) '.txt']);
% param.dim = param.rd;
% idx2 = kmeansClustering(reducedMatrix, trainIds, param, names,names.after);
% 'after second clustering'
% idx = load([names.prefix 'idx_before.txt']);
% 
% class = load([names.prefix names.file '_train.labels']);
% 
% 'idx and idx2'
% evaluateACMI(idx, idx2);
% % 'class and idx'
% % evaluateACMI(class, idx);
% 'class and idx2'
% evaluateACMI(class, idx2);
% 
% idx = [1;1;1;2;2];
% class = [1;0;0;1;1];
% param.trainCnt = 5;
'rand index(class,idx)'
RI(class,idx,param);
% 
% 'rand index(class,idx2)'
% RI(class,idx2,param);
% 
% 'rand index(idx,idx2)'
% RI(idx,idx2,param);


% evaluateGA(names, param, names.after);
% SI_after = evaluateSI(names, param)



%     reducePartitionsCov(options,names,param);
%     %===========================================
%     
%     B = 'before find dist class'
%     rd_dist = find_class_rd_dist_space(testMatrix, class, param, options, names);
%     %rd_dist = rd_dist
%     
%     % loading files
%     %testIds=load([names.prefix 'covtype_testIds' '.txt']);
%     %D = 'after loading testIds'
%     %org=load([names.prefix 'class_original_space' '.txt']);
%     %rd_cent=load([names.prefix 'class_rd_cent_space' '.txt']);
%     %rd_dist=load([names.prefix 'class_rd_dist_space' '.txt']);
%     
%     c1 = count_correct_class(org,testIds,class);
%     c1 = c1
%     c2 = count_correct_class(rd_cent,testIds,class);
%     c2 = c2
%     c3 = count_correct_class(rd_dist,testIds,class);
%     c3 = c3
%     
%     correctPercecnt_in_rd_cent = c2/c1
%     correctPercent_in_rd_dist = c3/c1
%     %arr1(i)=c2/c1;
%     %arr2(i)=c3/c1;
% %end
% 
%     %saveFile =['save -ascii '  names.prefix 'correctPercecnt_in_rd_cent_in_dimension' num2str(dim) '.txt arr1'];
%     %eval(saveFile);
%     
%     %saveFile =['save -ascii '  names.prefix 'correctPercent_in_rd_dist_in_dimension' num2str(dim) '.txt arr1'];
%     %eval(saveFile);
    
end

 


    

    
    