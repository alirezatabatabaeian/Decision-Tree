function [Labels] = Label_Fcn(ReGrouped_Data)

% This function can label all of the samples .

[R1,~] = size(ReGrouped_Data) ;
Labels = cell(R1,1) ;

for i = 1 : R1
    yes = 0 ;
    no  = 0 ;
    [R2,~] = size(ReGrouped_Data{i,1}) ;
    for j = 1 : R2
        if strcmpi(ReGrouped_Data{i,1}{j,1},'>50K')
            yes = yes + 1 ;
        else
            no = no + 1 ;
        end
    end
    if yes > no
        Labels{i,1} = '>50K' ;
    else
        Labels{i,1} = '<=50K' ;
    end
end

end