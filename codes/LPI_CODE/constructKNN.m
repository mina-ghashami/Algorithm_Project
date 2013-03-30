function[distances]=constructKNN(m1,m2,param) % m1 = reduced test partition , m2 = reduced train partition
s1=size(m1,1); % reduced test file size
s2=size(m2,1); % reduced partition file size
distances = sparse(s1,s2,0); 
s_d = size(distances);

for i=1:s1
  
  dist = EuDist2(m1(i,:),m2); % distance of the data point i to all others
  [dist,index]=sort(dist,2); % sort, real indexes are inserted in index 
  counter =1;
  while(dist(counter)==0)
      counter = counter +1;
  end
  kIndexes=index(counter:param.knn+counter-1); % extract the k elements
  rowIndexes=ones(1,param.knn)*i; % identical matrix of i
  distances(sub2ind(s_d,rowIndexes,kIndexes))=dist(counter:param.knn+counter-1); % inserting distances -> 1*knn
end 
