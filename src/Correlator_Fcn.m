function [Grouped_Data,UnGrouped_Data] = Correlator_Fcn(Data,Roots,Roots_Features,Grouped_Data,UnGrouped_Data)

% This Function finds the correlation of a sample with all of the roots .

[R,C] = size(Roots) ;
[~ , Number_of_Features] = size(Data) ;
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
[Max,Root] = max(Row_Matrix) ;
Repeat = 0 ;
for i = 1 : R
    if Row_Matrix(i,1) == Max
        Repeat = Repeat + 1 ;
    end
end

if Repeat == 1
    [r,~] = size(Grouped_Data{Root,1}) ;
    for i = 1 : Number_of_Features
        Grouped_Data{Root,1}{r+1,i} = Data{1,i} ;
    end
else
    [r,~] = size(UnGrouped_Data) ;
    for i = 1 : Number_of_Features
        UnGrouped_Data{r+1,i} = Data{1,i} ;
    end
end

end