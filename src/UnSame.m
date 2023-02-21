function [UnSames_Matrix] = UnSame(Matrix)

% This function finds the unsame roots of a tree because some samples can
% have a same root .

[R , C] = size( Matrix ) ;
K = 1 ;
UnSames_Matrix(1,:) = Matrix(1,:) ;

for i = 2 : R
    repeated = 0 ;
    for j = 1 : K
        if Matrix(i,1:C) == UnSames_Matrix(j,1:C)
           repeated = 1 ; 
        end
    end
    if repeated == 0
       UnSames_Matrix(K+1,1:C) = Matrix(i,1:C) ;
       K = K + 1 ;
    end
end   

end