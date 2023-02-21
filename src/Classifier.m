function [Matrix] = Classifier(Data_Train,Matrix,Row_Matrix,Number_of_Feature_with_the_highest_IG,Features)

% This Function classifies the roots .

[m,~] = size(Features) ;
[all_samples,~] = size(Data_Train) ;
Number_of_Values = 0 ;

for i = 1 : m
    if ~isempty(Features{i,Number_of_Feature_with_the_highest_IG})
        Number_of_Values = Number_of_Values + 1 ;
    end
end

switch Number_of_Feature_with_the_highest_IG
    case 1
         for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,2)   = 1 ;
                   end
               end
           end
        end   
    case 2        
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)   = Matrix(j,1) + 1 ;
                       Matrix(j,i+2) = Matrix(j,1) ;
                   end
               end
           end
        end   
    case 3
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)   = Matrix(j,1) + 1 ;
                       Matrix(j,i+9) = Matrix(j,1) ;
                   end
               end
           end
        end
    case 4
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)    = Matrix(j,1) + 1 ;
                       Matrix(j,i+25) = Matrix(j,1) ;
                   end
               end
           end
        end
    case 5
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)    = Matrix(j,1) + 1 ;
                       Matrix(j,i+32) = Matrix(j,1) ;
                   end
               end
           end
        end
    case 6
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)    = Matrix(j,1) + 1 ;
                       Matrix(j,i+46) = Matrix(j,1) ;
                   end
               end
           end
        end
    case 7
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)    = Matrix(j,1) + 1 ;
                       Matrix(j,i+52) = Matrix(j,1) ;
                   end
               end
           end
        end
    case 8
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)    = Matrix(j,1) + 1 ;
                       Matrix(j,i+57) = Matrix(j,1) ;
                   end
               end
           end
        end
    case 9
        for i = 1 : Number_of_Values
           for j = 1 : all_samples
               if Row_Matrix(j,1) == 1 
                   if strcmpi(Data_Train{j,Number_of_Feature_with_the_highest_IG},Features{i,Number_of_Feature_with_the_highest_IG})
                       Matrix(j,1)    = Matrix(j,1) + 1 ;
                       Matrix(j,i+59) = Matrix(j,1) ;
                   end
               end
           end
        end
end

end