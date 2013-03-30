function [] = draw_graphic_v2(data,class,ids,s)

category = zeros(3,size(data,1));
counter = ones(3,1);

for j=1:3 %number of classes
    for i=1:size(data,1)
        if(class(ids(i))==j)
            category(j,counter(j))=i;
            counter(j)=  counter(j)+1;
        end
    end
end
counter = counter - ones(3,1);
%cstring = 'rgbcmyk';
%figure
%hold on
for i=1:3
    points = get_data_by_id(data,category(i,:),counter(i,:));
    x = points(:,1);
    y = points(:,2);
    %s = ['.' cstring(mod(i,3)+1)];
    plot(x,y,s);
end
end