function [Entropy] = Entropy_calculator(New_Data_Train,Column,Row,Features,Number_of_all_New_Samples)

% This Function calculates the information gain .

yes = 0 ;
no  = 0 ;

for i = 1 : Number_of_all_New_Samples
    if strcmpi(New_Data_Train{i,Column},Features{Row,Column})
        if strcmpi(New_Data_Train{i,1},'>50K')
            yes = yes + 1 ;
        else
            no  = no  + 1 ;
        end
    end
end

p1 = (yes) / (yes + no) ;
p2 = (no) / (yes + no) ;

if (p1 == 0)||(p2 == 0)
    Entropy = 0 ;
else
    Entropy = - p1.*log2(p1) - p2.*log2(p2) ;
end

end