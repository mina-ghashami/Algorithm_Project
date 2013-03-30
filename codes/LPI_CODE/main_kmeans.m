function[]= main()
parameters = load(['data/parameters']);

param = [];
param.trainCnt = parameters(1); % train data
param.knn = parameters(2);
param.kmeans = parameters(3);
param.rd = parameters(4);  % reduced dimension


names=[];
names.prefix='data/';
names.file = 'mnist'; 
names.trainMatrixName='trainMatrix'; 
names.data='data';
names.clusterName = 'cluster';
names.IdName='Ids';
names.reduceParName='reducedPartition';
names.ids='ids';
names.GA = 'GA';
names.before = 'before';
names.after = 'after';


options = [];
options.Metric='Euclidean';
options.NeighborMode='KNN';
options.k = param.knn;
options.ReducedDim=param.rd;


f = load([names.prefix names.file '_' 'all' '.mat']);
% trainMatrix = f.faces';
trainMatrix = [f.train0 ; f.train1;f.train2;f.train3;f.train4;f.train5;f.train6;f.train7;f.train8;f.train9];
trainMatrix=double(trainMatrix);

% trainMatrix = load([names.prefix names.file '_train' '.data']);


param.dim = size(trainMatrix,2);
trainIds = 1:size(trainMatrix,1);


idx = kmeansClustering(trainMatrix, trainIds, param, names, names.before);

reducedMatrix = reduceByLPI(trainMatrix, names, options);
% 'afer reduce'
% reducedMatrix = load([names.prefix 'reduced_LPI_' num2str(options.ReducedDim) '.txt']);

param.dim = param.rd;
idx2 = kmeansClustering(reducedMatrix, trainIds, param, names,names.after);
% 'after second clustering'
% idx = load([names.prefix 'idx_before.txt']);

class = load([names.prefix names.file '_train.labels']);
  
'idx and idx2'
evaluateACMI(idx, idx2);
'class and idx'
evaluateACMI(class, idx);
'class and idx2'
evaluateACMI(class, idx2);


'rand index(idx,idx2)'
RI(idx,idx2,param);

'rand index(class,idx)'
RI(class,idx,param);

'rand index(class,idx2)'
RI(class,idx2,param);


end

