function [] = compute_std( )

X = 'olive';

parameters = load([X '/parameters']);

param = [];
param.trainCnt = parameters(1); %train data
param.rd = parameters(2);  % reduced dimension
param.knn = parameters(3); % for KNN 
param.kmeans = parameters(4);
% param.r = parameters(5);
% param.minpnt = parameters(6);


names=[];
names.file = X;
names.prefix= [X '/'];
 
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

X = X

f = load([names.prefix names.file '_' 'all' '.mat']);
trainMatrix = f.faces';
% trainMatrix = [f.train0 ; f.train1;f.train2;f.train3;f.train4;f.train5;f.train6;f.train7;f.train8;f.train9];
trainMatrix=double(trainMatrix);

% trainMatrix = load([names.prefix names.file '_' 'train' '.data']);

% f = load([names.prefix names.file '_' 'all' '.mat']);
% trainMatrix = f.faces';
% % trainMatrix = [f.train0 ; f.train1;f.train2;f.train3;f.train4;f.train5;f.train6;f.train7;f.train8;f.train9];
% trainMatrix=double(trainMatrix);

o = std(trainMatrix);
mean(o)
% saveFile =['save -ascii '  names.prefix names.file '_std_original_space' '.txt o'];
% eval(saveFile);

'rd=2'
reducedMatrix = load([names.prefix 'train_rd_LPI_2' '.txt']);
o = std(reducedMatrix);
mean(o)

'rd=6'
reducedMatrix = load([names.prefix 'train_rd_LPI_6' '.txt']);
o = std(reducedMatrix);
mean(o)

'rd=10'
reducedMatrix = load([names.prefix 'train_rd_LPI_10' '.txt']);
o = std(reducedMatrix);
mean(o)

end

