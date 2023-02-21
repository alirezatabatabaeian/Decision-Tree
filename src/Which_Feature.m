function [Feature_Number] = Which_Feature(Features,Value)

% This function finds the number of the feature of a value  

[R,C] = size(Features) ;

for i = 1 : C
    for j = 1 : R
        if strcmpi(Features{j,i},Value) 
           Feature_Number = i ; % Whenever it finds the number of the feature of a value ,
           return ;             % it returns the number of the column of that feature .
        end
    end
end

end