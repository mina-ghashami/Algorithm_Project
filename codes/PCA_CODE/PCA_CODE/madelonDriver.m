clear;

% Parameter Details
K = 2; % # Clusters taken from the leader boards


% Import data files
D_DATAFILE = 'Data/madelon/madelon_train.data';
L_DATAFILE = 'Data/madelon/madelon_train.labels';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%% Madelon %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

DRV_D = importdata(D_DATAFILE);
DRV_L = importdata(L_DATAFILE);
[m n] = size(DRV_L);

%%%%%%%%%%%%%%%%% PCA %%%%%%%%%%%%%%%%%%%%%%%%%%%

[pcaD_2,pcaMapping_2] = pca(DRV_D,2);
[pcaD_6,pcaMapping_6] = pca(DRV_D,6);
[pcaD_10,pcaMapping_10] = pca(DRV_D,10);

%%%%%%%%%%%%%%%% K-Means %%%%%%%%%%%%%%%%%%%%%%%%

% K-Means Clustering w/o Reduction
disp('Results: K-Means on Madelon w/out PCA');
km = kmeans(DRV_D,K);
evaluateACMI(DRV_L, km)
newRI(DRV_L,km,m)

% K-Means Clustering w/ Reduction
disp('Results: K-Means on Madelon w/ PCA (Dim = 2)');
kmpca_2 = kmeans(pcaD_2,K);
evaluateACMI(DRV_L,kmpca_2)
newRI(DRV_L,kmpca_2,m)

disp('Results: K-Means on Madelon w/ PCA (Dim = 6)');
kmpca_6 = kmeans(pcaD_6,K);
evaluateACMI(DRV_L,kmpca_6)
newRI(DRV_L,kmpca_6,m)

disp('Results: K-Means on Madelon w/ PCA (Dim = 10)');
kmpca_10 = kmeans(pcaD_10,K);
evaluateACMI(DRV_L,kmpca_10)
newRI(DRV_L,kmpca_10,m)


% Compare Results
disp('Results: Comparing Results of 2-Dim Reduction vs. No Reduction on Madelon with K-Means');
evaluateACMI(km, kmpca_2)
newRI(km, kmpca_2, m)

disp('Results: Comparing Results of 6-Dim Reduction vs. No Reduction on Madelon with K-Means');
evaluateACMI(km, kmpca_6)
newRI(km, kmpca_6, m)

disp('Results: Comparing Results of 10-Dim Reduction vs. No Reduction on Madelon with K-Means');
evaluateACMI(km, kmpca_10)
newRI(km, kmpca_10, m)

%%%%%%%%%%%%%%%%% DBScan %%%%%%%%%%%%%%%%%%%%%%%%%

% DBScan w/o Reduction
disp('Results: DBScan on Madelon w/out PCA');
db = dbscan(DRV_D,720,3)';
evaluateACMI(DRV_L, db)
newRI(DRV_L,db,m)

% DBScan w/ Reduction
disp('Results: DBScan on Madelon w/ PCA (Dim = 2)');
dbpca_2 = dbscan(pcaD_2,720,3)';
evaluateACMI(DRV_L, dbpca_2)
newRI(DRV_L,dbpca_2,m)

disp('ACMI: DBScan on Madelon w/ PCA (Dim = 6)');
dbpca_6 = dbscan(pcaD_6,720,3)';
evaluateACMI(DRV_L, dbpca_6)
newRI(DRV_L, dbpca_6,m)

disp('ACMI: DBScan on Madelon w/ PCA (Dim = 10)');
dbpca_10 = dbscan(pcaD_10,720,3)';
evaluateACMI(DRV_L, dbpca_10)
newRI(DRV_L, dbpca_10,m)

% Compare Results
disp('Results: Comparing Results of 2-Dim Reduction vs. No Reduction on Madelon with DBScan');
evaluateACMI(db, dbpca_2)
newRI(db, dbpca_2, m)

disp('Results: Comparing Results of 6-Dim Reduction vs. No Reduction on Madelon with K-Means');
evaluateACMI(db, dbpca_6)
newRI(db, dbpca_6, m)

disp('Results: Comparing Results of 10-Dim Reduction vs. No Reduction on Madelon with K-Means');
evaluateACMI(db, dbpca_10)
newRI(db, dbpca_10, m)


%TODO: Insert 3rd Clustering Alg Here

