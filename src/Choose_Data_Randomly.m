function [New_Data_Train,New_Data_Test] = Choose_Data_Randomly(Data_Train,P)

% This function choose P percent of the data randomly .

[Number_of_Samples , Number_of_features] = size(Data_Train) ;
Number_of_needed_Data = (P/100) * Number_of_Samples ;
Vector = randperm(Number_of_Samples) ;

for i = 1 : Number_of_needed_Data
    for j = 1 : Number_of_features
         New_Data_Train(i,j) = Data_Train(Vector(1,i),j) ;
    end
end

for i = (Number_of_needed_Data + 1) :  Number_of_Samples
    for j = 1 : Number_of_features
         New_Data_Test(i - Number_of_needed_Data , j) = Data_Train(Vector(1,i),j) ;
    end
end

end

