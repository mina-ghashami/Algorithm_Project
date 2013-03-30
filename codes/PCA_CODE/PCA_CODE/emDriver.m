% EM for Gisette
clear;

L_DATAFILE = 'Data/gisette/gisette_train.labels';
L_PRE = 'Data/EMFiles/regular/class_gisette.txt';
L_POST_2 = 'Data/EMFiles/Reduced/gisette_class_2.txt';
L_POST_6 = 'Data/EMFiles/Reduced/gisette_class_6.txt'; 
L_POST_10 = 'Data/EMFiles/Reduced/gisette_class_10.txt';

DRV_L = importdata(L_DATAFILE);
[m n] = size(DRV_L);

em = importdata(L_PRE);
em_PCA2 = importdata(L_POST_2);
em_PCA6 = importdata(L_POST_6);
em_PCA10 = importdata(L_POST_10);

disp('Results: EM on Gisette w/out PCA');
evaluateACMI(DRV_L, em)
newRI(DRV_L,em,m)

disp('Results: EM on Gisette w/ PCA (Dim = 2)');
evaluateACMI(DRV_L, em_PCA2)
newRI(DRV_L,em_PCA2,m)

disp('Results: EM on Gisette w/ PCA (Dim = 6)');
evaluateACMI(DRV_L, em_PCA6)
newRI(DRV_L,em_PCA6,m)

disp('Results: EM on Gisette w/ PCA (Dim = 10)');
evaluateACMI(DRV_L, em_PCA10)
newRI(DRV_L,em_PCA10,m)

disp('Results: Comparing Gisette w/out reduction to PCA_2 reduction');
evaluateACMI(em, em_PCA2)
newRI(em,em_PCA2,m)

disp('Results: Comparing Gisette w/out reduction to PCA_6 reduction');
evaluateACMI(em, em_PCA6)
newRI(em,em_PCA6,m)

disp('Results: Comparing Gisette w/out reduction to PCA_10 reduction');
evaluateACMI(em, em_PCA10)
newRI(em,em_PCA10,m)

% EM for madelon
clear;

L_DATAFILE = 'Data/madelon/madelon_train.labels';
L_PRE = 'Data/EMFiles/regular/class_madelon.txt';
L_POST_2 = 'Data/EMFiles/Reduced/madelon_class_2.txt';
L_POST_6 = 'Data/EMFiles/Reduced/madelon_class_6.txt'; 
L_POST_10 = 'Data/EMFiles/Reduced/madelon_class_10.txt';

DRV_L = importdata(L_DATAFILE);
[m n] = size(DRV_L);

em = importdata(L_PRE);
em_PCA2 = importdata(L_POST_2);
em_PCA6 = importdata(L_POST_6);
em_PCA10 = importdata(L_POST_10);

disp('Results: EM on Madelon w/out PCA');
evaluateACMI(DRV_L, em)
newRI(DRV_L,em,m)

disp('Results: EM on Madelon w/ PCA (Dim = 2)');
evaluateACMI(DRV_L, em_PCA2)
newRI(DRV_L,em_PCA2,m)

disp('Results: EM on Madelon w/ PCA (Dim = 6)');
evaluateACMI(DRV_L, em_PCA6)
newRI(DRV_L,em_PCA6,m)

disp('Results: EM on Madelon w/ PCA (Dim = 10)');
evaluateACMI(DRV_L, em_PCA10)
newRI(DRV_L,em_PCA10,m)

disp('Results: Comparing Madelon w/out reduction to PCA_2 reduction');
evaluateACMI(em, em_PCA2)
newRI(em,em_PCA2,m)

disp('Results: Comparing Madelon w/out reduction to PCA_6 reduction');
evaluateACMI(em, em_PCA6)
newRI(em,em_PCA6,m)

disp('Results: Comparing Madelon w/out reduction to PCA_10 reduction');
evaluateACMI(em, em_PCA10)
newRI(em,em_PCA10,m)

% EM for olivetti
clear;

L_PRE = 'Data/EMFiles/regular/class_olive.txt';
L_POST_2 = 'Data/EMFiles/Reduced/olive_class_2.txt';
L_POST_6 = 'Data/EMFiles/Reduced/olivetti_class_6.txt'; 
L_POST_10 = 'Data/EMFiles/Reduced/olivetti_class_10.txt';

DRV_L = [];
for i = 1:40
    for j = 1:10
        DRV_L([[i-1]*10]+[j],1)=i;
    end
end
[m n] = size(DRV_L);

em = importdata(L_PRE);
em_PCA2 = importdata(L_POST_2);
em_PCA6 = importdata(L_POST_6);
em_PCA10 = importdata(L_POST_10);

disp('Results: EM on Olivetti w/out PCA');
evaluateACMI(DRV_L, em)
newRI(DRV_L,em,m)

disp('Results: EM on Olivetti w/ PCA (Dim = 2)');
evaluateACMI(DRV_L, em_PCA2)
newRI(DRV_L,em_PCA2,m)

disp('Results: EM on Olivetti w/ PCA (Dim = 6)');
evaluateACMI(DRV_L, em_PCA6)
newRI(DRV_L,em_PCA6,m)

disp('Results: EM on Olivetti w/ PCA (Dim = 10)');
evaluateACMI(DRV_L, em_PCA10)
newRI(DRV_L,em_PCA10,m)

disp('Results: Comparing Olivetti w/out reduction to PCA_2 reduction');
evaluateACMI(em, em_PCA2)
newRI(em,em_PCA2,m)

disp('Results: Comparing Olivetti w/out reduction to PCA_6 reduction');
evaluateACMI(em, em_PCA6)
newRI(em,em_PCA6,m)

disp('Results: Comparing Olivetti w/out reduction to PCA_10 reduction');
evaluateACMI(em, em_PCA10)
newRI(em,em_PCA10,m)
