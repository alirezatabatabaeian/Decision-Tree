function [Grouped_Data,UnGrouped_Data] = Grouping_Fcn(Roots,Data_for_Grouping,Features)

% This Function groups all of the data according to the roots .

[Number_of_Roots , ~] = size(Roots) ;
[Number_of_Samples , ~] = size(Data_for_Grouping) ;
Grouped_Data = cell(Number_of_Roots,1) ;
UnGrouped_Data = cell(0,0) ;
Data = cell(1,9) ;

Roots_Features = Roots_Features_Fcn(Roots,Features) ;

for i1 = 1 : Number_of_Samples
    for j = 1 : 9
        Data{1,j} = Data_for_Grouping{i1,j} ;
    end
    [Grouped_Data,UnGrouped_Data] = Correlator_Fcn(Data,Roots,Roots_Features,Grouped_Data,UnGrouped_Data) ;
end

end

