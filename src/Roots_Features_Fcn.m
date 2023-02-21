function [Roots_Features] = Roots_Features_Fcn(Roots,Features)

% This function can find the feature of each value in roots .

[R , C] = size(Roots) ;

for i = 1 : R
    for j = 1 : C
        if ~isempty(Roots{i,j})
            Roots_Features(i,j) = Which_Feature(Features,Roots{i,j}) ;
        else
            break
        end
    end
end

end

