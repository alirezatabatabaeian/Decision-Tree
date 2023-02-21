function [Number_of_a_Value] = Number_of_a_Value_of_a_Feature(Data_Train , Column , Value)

% This function finds the number of repeatation of an specific value in
% train data .

Features = Find_Features(Data_Train) ;
Number_of_a_Value = 0 ;
[Number_of_Samples , ~] = size(Data_Train) ;

for i = 1 : Number_of_Samples
    if strcmpi(Data_Train{i,Column},Features{Value,Column})
       Number_of_a_Value = Number_of_a_Value + 1 ;
    end
end  

end