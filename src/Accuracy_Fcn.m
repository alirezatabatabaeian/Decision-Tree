function [Accuracy] = Accuracy_Fcn(Grouped_Data,UnGrouped_Data,Label_Column)

% This Function finds the accuracy of the labels .

[R1,~] = size(Grouped_Data) ;
[R2,~] = size(UnGrouped_Data) ;
Correct = 0 ;
Wrong   = 0 ;

for i = 1 : R1
    [r1,~] = size(Grouped_Data{i,1}) ;
    if r1 ~= 0
        for j = 1 : r1
            if strcmpi(Grouped_Data{i,1}{j,1},Grouped_Data{i,2})
                Correct = Correct + 1 ;
            else
                Wrong   = Wrong   + 1 ;
            end
        end     
    end
end

if R2 ~= 0
    for i = 1 : R2
         if strcmpi(UnGrouped_Data{i,1},UnGrouped_Data{i,Label_Column})
             Correct = Correct + 1 ;
         else
             Wrong   = Wrong   + 1 ;
         end
    end
end

Accuracy = (Correct)./(Correct+Wrong) ;

end