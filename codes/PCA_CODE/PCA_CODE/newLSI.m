function [train_reduced] = newLSI(trainMatrix,rd)

trMatrix_trnsp = trainMatrix'; % transpose train matrix such that columns are features and rows are documents
[U,S,V] = svds(trMatrix_trnsp,rd);
train_reduced = inv(S)*U'*trMatrix_trnsp;
train_reduced = train_reduced';
