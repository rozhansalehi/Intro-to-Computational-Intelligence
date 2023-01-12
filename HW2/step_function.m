function [Y]= step_function(X)
Y = zeros(size(X,1),size(X,2));
for i = 1:size(X,1)
    for j=1:size(X,2)
        if X(i,j)<0
            Y(i,j)=0;
        else
            Y(i,j)=1;
        end
    end
end
end
