% draw each class with different color
function [] = draw_graphic(data,class)

% data = [1 2 3; 4 5 6; 7 8 9; 10 11 12; 13 14 15; 16 17 18; 19 20 21; 22 23 24];
% class = [1; 2; 3 ; 4;5;6;7;1];
class_size = 2; % 2 ta class darim, barchasb class ha ham az 1 ta 2 ast
category = zeros(class_size,size(data,1));
counter = ones(class_size,1);

for j=1:class_size
    for i=1:size(data,1)
        if(class(i) == j)
            category(j,counter(j)) = i;
            counter(j) = counter(j) + 1;
        end
    end
end
counter = counter - ones(class_size,1);

cstring='rgbcmyk'; % color string
figure
hold on
for i=1:class_size
    points = get_data_by_id(data,category(i,:),counter(i,:));
    x = points(:,1);
    y = points(:,2);
    s = ['.' cstring(mod(i,class_size)+1)];
    plot(x,y,s)  % plot with a different color each time
end

end