function [Tree_Size] = Size_of_Tree(Roots)

% This function can find the size of a tree .

[R,C] = size(Roots) ;
Size_Matrix = zeros(R,C) ;

for i = 1 : R
    for j = 1 : C
        if ~isempty(Roots{i,j})
            Size_Matrix(i,j) = 1 ;
        else
            break ;
        end
    end
end

Row_Matrix = sum(Size_Matrix')' ;
[Tree_Size,~] = max(Row_Matrix) ;

end