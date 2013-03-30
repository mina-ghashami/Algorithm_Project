function [train_reduced] = reduceByLPI(trainMatrix,names,options)

%---------------- reduce train Matrix ---------------------
G = 'after constructW'
weight = constructW(trainMatrix,options);    
[eigvector, eigvalue] = LPP(weight, options, trainMatrix);

train_reduced = trainMatrix*eigvector;

saveFile =['save -ascii '  names.prefix 'train_rd_LPI_' num2str(options.ReducedDim) '.txt train_reduced'];
eval(saveFile); 

end