function [points] = get_data_by_id(data,category,counter)
points = zeros(counter,2);
for i=1:counter
    points(i,:) = data(category(i),:);
end
end