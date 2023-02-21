function [Row_Matrix] = Sames(Matrix,Row)

% This function can sort all of the data in a matrix .

[all_samples,~] = size(Matrix) ;
Row_Matrix = zeros(all_samples,1) ;

for i = 1 : all_samples
    if Matrix(i,:) == Matrix(Row,:)
       Row_Matrix(i,1) = 1 ;
    else
       Row_Matrix(i,1) = 0 ;
    end
end

end