function [] = newRI(c1,c2,trainCnt)
    counter = 0;;
    for i=1:trainCnt
        for j=i+1:trainCnt
            if((c1(i)==c1(j) && c2(i)==c2(j)) || (c1(i)~=c1(j) && c2(i)~=c2(j)))
                counter = counter + 1;
            end
        end
    end
    total = trainCnt*(trainCnt-1)/2;
    RandIndex = counter/total
end
