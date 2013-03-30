function [] = RI(c1,c2,param)
    counter = 0;;
    for i=1:param.trainCnt
        for j=i+1:param.trainCnt
            if((c1(i)==c1(j) && c2(i)==c2(j)) || (c1(i)~=c1(j) && c2(i)~=c2(j)))
                counter = counter + 1;
            end
        end
    end
    total = param.trainCnt*(param.trainCnt-1)/2;
    RandIndex = counter/total
end
