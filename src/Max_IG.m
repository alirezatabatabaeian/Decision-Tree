function [Number_of_Feature_with_the_highest_IG] = Max_IG(Data_Train,Row_Matrix,Number_of_Samples,Number_of_features)

% This function finds the maximum Information Gain

IGs = zeros(1,Number_of_features-1);
k = 1 ;
Num = 0 ;

for i = 1 : Number_of_Samples
    if Row_Matrix(i,1) == 1
        Num = Num + 1 ;
    end
end

New_Data_Train = cell(Num,Number_of_features);

for i = 1 : Number_of_Samples
    if Row_Matrix(i,1) == 1
        for j = 1 : Number_of_features
            New_Data_Train{k,j} = Data_Train{i,j} ;
        end
        k = k + 1 ;
    end
end

Features = Find_Features(New_Data_Train) ;
[Number_of_Rows_of_Features , ~] = size(Features) ;

%%

for i = 2 : Number_of_features
    IGs(i-1) = Find_IG(New_Data_Train,i,Features,Number_of_Rows_of_Features) ;
end

[IG_Max , Max_Indice] = max(IGs) ;

if IG_Max == 0
    Number_of_Feature_with_the_highest_IG = 1 ;
else
    Number_of_Feature_with_the_highest_IG = Max_Indice + 1 ;
end

end