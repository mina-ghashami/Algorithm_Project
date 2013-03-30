function [] =computeDistance(trainMatrix,param)
min_d = EuDist2(trainMatrix(1,:),trainMatrix(2,:));
max_d = EuDist2(trainMatrix(1,:),trainMatrix(2,:));
total = 0;
for i=1:2000%param.trainCnt
%     for j=i+1:param.trainCnt
        d = EuDist2(trainMatrix(i,:),trainMatrix(i+200,:));
        min_d = min(d,min_d);
        max_d = max(d,max_d);
        total = total + d;
%     end
end

min_d = min_d
max_d = max_d
avg_distance = total/2000%(param.trainCnt * (param.trainCnt -1)/2)
end