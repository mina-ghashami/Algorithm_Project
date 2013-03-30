function [train_reduced] = reduceByLSI(trainMatrix,param,names)

%---------------- reduce train Matrix ---------------------
trMatrix_trnsp = trainMatrix'; % transpose train matrix such that columns are features and rows are documents
[U,S,V] = svds(trMatrix_trnsp,param.rd); % param.rd = reduced_dim

train_reduced = inv(S)*U'*trMatrix_trnsp;
train_reduced = train_reduced';

save([names.prefix 'train_rd_cent_space_LSI.txt'],'train_reduced','-ascii');

end