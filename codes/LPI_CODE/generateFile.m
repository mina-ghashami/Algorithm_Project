function[]= generateFile(AC,MI,RI,fid)
    for i=1:3
        fprintf(fid,'%f\t%f\t%f\n',AC(i),MI(i),RI(i));
    end


end

