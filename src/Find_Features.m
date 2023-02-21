function [Features] = Find_Features(Data_Train)

% This Function finds the feature vector .

[Number_of_Samples , Number_of_features ] = size(Data_Train) ;

if Number_of_Samples ~= 1
   Data_Train = sort(Data_Train) ;
end

for i = 1 : Number_of_features
    k = 1 ;
    Features{1 , i} = Data_Train{1 , i} ;
    for j = 2 : Number_of_Samples
        if ~strcmpi( Data_Train{j , i} , Data_Train{j-1 , i} )
           k = k + 1 ;
           Features{k , i} = Data_Train{j , i} ;
        end 
    end
end

end