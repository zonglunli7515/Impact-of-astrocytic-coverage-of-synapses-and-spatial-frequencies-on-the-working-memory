X = rand(5,5);
save('data.mat', 'X')
Y = load('data.mat');
Y = Y.X;

boxplot(Y, 'Labels',{0.1,0.2,0.3,0.4,0.5}) % each box represents a column
% boxchart(Y') % each box represents a row
xlabel('Column')
ylabel('Value')
