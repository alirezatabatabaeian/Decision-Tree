function [Label] = Ungrouped_Label_Fcn(Data,Roots,Roots_Features,Labels)

% This Function Lables the data with no group because some data can have no
% root . 
% So it finds the nearest labels and polls between them .

[R,C] = size(Roots) ;
Corr_Matrix = zeros(R,C) ;
Row_Matrix = zeros(R,1) ;
 
for i = 1 : R
    for j = 1 : C
        if ~isempty(Roots{i,j})
            Feature_Number = Roots_Features(i,j) ;
            if strcmpi(Data{1,Feature_Number} , Roots{i,j})
               Corr_Matrix(i,j) = 1 ;
            else
               break ;
            end
        end
    end
end

Row_Matrix = sum(Corr_Matrix')' ;
[Max,~] = max(Row_Matrix) ;

yes = 0 ;
no  = 0 ;

for i = 1 : R
    if Row_Matrix(i,1) == Max
        if strcmpi(Labels(i,1),'>50K')
            yes = yes + 1 ;
        else
            no  = no  + 1 ;
        end
    end
end

if yes > no 
    Label = '>50K' ;
else
    Label = '<=50K' ;
end

end