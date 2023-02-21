function [IG] = Find_IG(New_Data_Train,Column,Features,Number_of_Rows_of_Features)

% This Function finds the best IG

[Number_of_all_New_Samples,~] = size(New_Data_Train) ;
Entropy_YcondX = 0 ;

for i = 1 : Number_of_Rows_of_Features
    if ~isempty(Features{i,Column})
        p = Number_of_a_Value_of_a_Feature(New_Data_Train , Column , i) ;
        Entropy_YcondX = Entropy_YcondX + (p/Number_of_all_New_Samples).*Entropy_calculator(New_Data_Train,Column,i,Features,Number_of_all_New_Samples) ;
    end
end

yes = 0 ;
no  = 0 ;

for i = 1 : Number_of_all_New_Samples
    if strcmpi(New_Data_Train{i,1},'>50K')
        yes = yes + 1 ;
    else
        no  = no  + 1 ;
    end
end

p1 = (yes) / (yes + no) ;
p2 = (no) / (yes + no) ;

if (p1 == 0)||(p2 == 0)
    Entropy_Y = 0 ;
else
    Entropy_Y = - p1.*log2(p1) - p2.*log2(p2) ;
end

IG = Entropy_Y - Entropy_YcondX ;
    
end