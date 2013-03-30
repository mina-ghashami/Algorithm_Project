clear;

% Parameter Details
K = 10; % # Clusters taken from the leader boards

% Import data files
D_DATAFILE = load('Data/mnist/mnist_all.mat');
L_DATAFILE = 'Data/mnist/mnist_train.labels';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%% Mnist %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DRV_D = double(D_DATAFILE.train0);
[pcaD_2, pcaMapping_2] = pca(DRV_D,2);
[pcaD_6, pcaMapping_6] = pca(DRV_D,6);
[pcaD_10, pcaMapping_10] = pca(DRV_D,10);

data_tmp = double(D_DATAFILE.train1);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train2);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train3);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train4);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train5);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train6);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train7);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train8);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

data_tmp = double(D_DATAFILE.train9);
[pca_tmp2, pcaMapping_2] = pca(data_tmp,2);
[pca_tmp6, pcaMapping_6] = pca(data_tmp,6);
[pca_tmp10, pcaMapping_10] = pca(data_tmp,10);

DRV_D = [DRV_D;data_tmp];
pcaD_2 = [pcaD_2;pca_tmp2];
pcaD_6 = [pcaD_6;pca_tmp6];
pcaD_10 = [pcaD_10;pca_tmp10];

DRV_L = importdata(L_DATAFILE);

[m n] = size(DRV_L);
%%%%%%%%%%%%%%%%%%%% Cleanup %%%%%%%%%%%%%%%%%%%%

clear data_tmp;
clear pcaMapping*;
clear pca_tmp*
clear D_DATAFILE;
clear L_DATAFILE;

%%%%%%%%%%%%%%%% K-Means %%%%%%%%%%%%%%%%%%%%%%%%

% K-Means Clustering w/o Reduction
disp('Results: K-Means on mnist w/out PCA');
km = kmeans(DRV_D,K);
evaluateACMI(DRV_L, km)
newRI(DRV_L,km,m)


% K-Means Clustering w/ Reduction
disp('Results: K-Means on mnist w/ PCA (Dim = 2)');
kmpca_2 = kmeans(pcaD_2,K);
evaluateACMI(DRV_L,kmpca_2)
newRI(DRV_L,kmpca_2,m)

disp('Results: K-Means on mnist w/ PCA (Dim = 6)');
kmpca_6 = kmeans(pcaD_6,K);
evaluateACMI(DRV_L,kmpca_6)
newRI(DRV_L,kmpca_6,m)

disp('Results: K-Means on mnist w/ PCA (Dim = 10)');
kmpca_10 = kmeans(pcaD_10,K);
evaluateACMI(DRV_L,kmpca_10)
newRI(DRV_L,kmpca_10,m)

% Compare Results
disp('Results: Comparing Results of 2-Dim Reduction vs. No Reduction on mnist with K-Means');
evaluateACMI(km, kmpca_2)
newRI(km, kmpca_2, m)

disp('Results: Comparing Results of 6-Dim Reduction vs. No Reduction on mnist with K-Means');
evaluateACMI(km, kmpca_6)
newRI(km, kmpca_6, m)

disp('Results: Comparing Results of 10-Dim Reduction vs. No Reduction on mnist with K-Means');
evaluateACMI(km, kmpca_10)
newRI(km, kmpca_10, m)

%%%%%%%%%%%%%%%%% DBScan %%%%%%%%%%%%%%%%%%%%%%%%%

disp('Skipping DBScan because it takes too long...');

%% DBScan w/o Reduction
%disp('Results: DBScan on mnist w/out PCA');
%db = dbscan(DRV_D,20800,3)';
%evaluateACMI(DRV_L, db)
%newRI(DRV_L,db,m)


%% DBScan w/ Reduction
%disp('Results: DBScan on mnist w/ PCA (Dim = 2)');
%dbpca_2 = dbscan(pcaD_2,20800,3)';
%evaluateACMI(DRV_L, dbpca_2)
%newRI(DRV_L, dbpca_2,m)

%disp('ACMI: DBScan on mnist w/ PCA (Dim = 6)');
%dbpca_6 = dbscan(pcaD_6,20800,3)';
%evaluateACMI(DRV_L, dbpca_6)
%newRI(DRV_L, dbpca_6,m)

%disp('ACMI: DBScan on mnist w/ PCA (Dim = 2)');
%dbpca_10 = dbscan(pcaD_10,20800,3)';
%evaluateACMI(DRV_L, dbpca_10)
%newRI(DRV_L, dbpca_10,m)

%% Compare Results
%disp('Results: Comparing Results of 2-Dim Reduction vs. No Reduction on mnist with DBScan');
%evaluateACMI(db, dbpca_2)
%newRI(db, dbpca_2, m)

%disp('Results: Comparing Results of 6-Dim Reduction vs. No Reduction on mnist with DBScan');
%evaluateACMI(db, dbpca_6)
%newRI(db, dbpca_6, m)

%disp('Results: Comparing Results of 10-Dim Reduction vs. No Reduction on mnist with DBScan');
%evaluateACMI(db, dbpca_10)
%newRI(db, dbpca_10, m)


%TODO: Insert 3rd Clustering Alg Here


