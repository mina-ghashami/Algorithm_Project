function[]= main_dbscan()
load -ascii data/parameters

param = [];
param.trainCnt = parameters(1); %train data
param.rd = parameters(2);  % reduced dimension
param.knn = parameters(3); % for KNN 
param.kmeans = parameters(4);
param.r = parameters(5);
param.minpnt = parameters(6);


names=[];
names.file = 'mnist';
names.prefix= 'data/';
names.trainMatrixName='trainMatrix'; 
names.data='data';
names.clusterName = 'cluster';
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

% for i=1:5
%     options.ReducedDim = 2*i
    
f = load([names.prefix names.file '_' 'all' '.mat']);
trainMatrix = [f.train0 ; f.train1;f.train2;f.train3;f.train4;f.train5;f.train6;f.train7;f.train8;f.train9];
trainMatrix=double(trainMatrix);

% f = load([names.prefix names.file '_' 'all' '.mat']);
% % trainMatrix = f.faces';
% trainMatrix=double(trainMatrix);

% trainMatrix = load([names.prefix names.file '_train.data']);

param.dim = size(trainMatrix,2);
trainIds = 1:size(trainMatrix,1);

AC = zeros(3,1);
NMI = zeros(3,1);
RI_arr = zeros(3,1);


[class,type] = dbscan(trainMatrix,param.minpnt,param.r);
class = class';
type = type';
saveFile =['save -ascii '  names.prefix 'class_before' '.txt class'];
eval(saveFile);
saveFile =['save -ascii '  names.prefix 'type_before' '.txt type'];
eval(saveFile);


reducedMatrix = reduceByLPI(trainMatrix, names, options);
% 'afer reduce'
% reducedMatrix = load([names.prefix 'reduced_LPI_' num2str(options.ReducedDim) '.txt']);
param.dim = param.rd;

[class2,type2] = dbscan(reducedMatrix,param.minpnt,param.r);
class2 = class2';
type2 = type2';
saveFile =['save -ascii '  names.prefix 'class_after_' num2str(options.ReducedDim) '.txt class2'];
eval(saveFile);
saveFile =['save -ascii '  names.prefix 'type_after_' num2str(options.ReducedDim) '.txt type2'];
eval(saveFile);


class = load([names.prefix names.file '_train.labels']);
%draw_graphic(reducedMatrix,idx2);
 
'idx and idx2'
[AC(1),NMI(1)] = evaluateACMI(idx, idx2);
'class and idx'
[AC(2),NMI(2)] = evaluateACMI(class, idx);
'class and idx2'
[AC(3),NMI(3)] = evaluateACMI(class, idx2);


'rand index(idx,idx2)'
RI_arr(3) = RI(idx,idx2,param);

'rand index(class,idx)'
RI_arr(1) = RI(class,idx,param);

'rand index(class,idx2)'
RI_arr(2) = RI(class,idx2,param);

    
end