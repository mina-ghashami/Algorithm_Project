function [] = draw_distributed_LPI()

load -ascii merged-data\parameters.txt

param = [];
param.dataCnt = parameters(1); %all data
param.testCnt = parameters(2); %test data
param.r = parameters(3); % for both partitioning and constructing weight matrix?
param.knn = parameters(4); % for KNN & evaluation
param.rd = parameters(5);  % reduced dimension
param.read = parameters(6); % fek konam: if read==1 then read reduced data from a file and do evaluation
param.kmeans = parameters(7);


names=[];
names.prefix='merged-data\kmn5\';
names.file = 'merged'; 
names.trainMatrixName='trainMatrix'; 
names.partitionName='partition';
names.clusterName = 'cluster';
names.weightName='weight';
names.reduceParName='reducedPartition';
names.reduceTestName='reducedTestPartition';
names.realIdxName='realIdx';
names.partialName = [num2str(param.dataCnt) '_' num2str(param.testCnt) '_' num2str(param.r) '_' num2str(param.knn)];

options = [];
options.Metric='Euclidean';
options.NeighborMode='KNN';
options.k = param.knn;
options.ReducedDim=param.rd;

train_class = load([names.prefix 'classes3.txt']);
% figure
% hold on
% cstring = 'rgbcmyk';
for i=1:5
%     s = ['.' cstring(mod(i,3)+1)];
    ids = load([names.prefix names.realIdxName '_' names.file '_' num2str(i) '.txt']);
    data = load([names.prefix names.reduceParName names.file '_trainMatrix_2_' num2str(i) '.txt']);
%     draw_graphic_v2(data,train_class,ids,s); %draw each cluster in a unique color
    draw_graphic(data,train_class,ids)
end
end