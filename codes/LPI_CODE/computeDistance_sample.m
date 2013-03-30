function [] = computeDistance_sample(trainMatrix,param)
min_d = EuDist2(trainMatrix(1,:),trainMatrix(2,:));
max_d = EuDist2(trainMatrix(1,:),trainMatrix(2,:));
total = 0;

for i=1:100
    d = EuDist2(trainMatrix(i,:),trainMatrix(i+200,:));
    min_d = min(d,min_d);
    max_d = max(d,max_d);
    total = total + d; 
end

min_d = min_d
max_d = max_d
avg_distance = total/(100)
end
