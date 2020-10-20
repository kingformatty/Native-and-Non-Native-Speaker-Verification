function [ rank , w] = mutInfFS( X,Y,numF )
% This function is to using mutual information calculated from muteinf
% function to rank the relationship between the labels and every individual
% features and save the index in "vector"
rank = [];
for i = 1:size(X,2)
    rank = [rank; -muteinf(X(:,i),Y) i];
end
rank = sortrows(rank,1);    
w = rank(1:numF, 1);
rank = rank(1:numF, 2);

end
