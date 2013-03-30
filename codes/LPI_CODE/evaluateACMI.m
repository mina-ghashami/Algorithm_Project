function [AC,MI] = evaluateACMI(idx, idx2)
    %idx2 is an array containing cluster labels after dim red
    %idx is an array containing cluster labels before dim red
    res = bestMap(idx,idx2);
    %============= evaluate AC: accuracy ==============
    AC = length(find(idx == res))/length(idx)
    %============= evaluate MIhat: nomalized mutual information =================
    MI = MutualInfo(idx,res)

end