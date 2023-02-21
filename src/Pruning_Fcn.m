function [New_Roots,New_Train_Accuracy,Labels] = Pruning_Fcn(Data_Train,Roots,Row,Features,Last_Train_Accuracy,Labels)

% This function prunes the roots .

[Number_of_Roots , C] = size(Roots) ;
[~ , Number_of_Features] = size(Data_Train) ;
Label_Column = Number_of_Features + 1 ;
Corr_Matrix = zeros(Number_of_Roots,C) ;
Root = cell(1,C) ;
Number_of_Columns = 0 ;
Old_Labels = Labels ;

for i = 1 : C
    if ~isempty(Roots{Row,i})
        Root{1,i} = Roots{Row,i} ;
        Number_of_Columns = Number_of_Columns + 1 ;
    end
end
Root{1,Number_of_Columns} = {} ;

for i = 1 : Number_of_Roots
    Repeat = 0 ;
    for j = 1 : C
        if     (~isempty(Root{1,j})) && (~isempty(Roots{i,j}))
                if strcmpi(Root{1,j},Roots{i,j})
                    Corr_Matrix(i,j) = 1 ;
                else
                    break ;
                end
        elseif (~isempty(Root{1,j})) && (isempty(Roots{i,j}))
                break ;
        elseif (isempty(Root{1,j}))  && (~isempty(Roots{i,j}))
                Repeat = Repeat + 1 ;
                if Repeat == 2
                    New_Roots = Roots ;
                    New_Train_Accuracy = Last_Train_Accuracy ;
                    return ;
                end
        elseif (isempty(Root{1,j}))  && (isempty(Roots{i,j}))
                break ;
        end
    end
end

Row_Matrix = sum(Corr_Matrix')' ;

K = 1 ;

for i = 1 : Number_of_Roots
    if ~(Row_Matrix(i,1) == (Number_of_Columns - 1))
        for j = 1 : Number_of_Features-1
            Modified_Roots{K,j} = Roots{i,j} ;
        end
        K = K + 1 ;
    elseif i == Row
        for j = 1 : Number_of_Columns-1
            Modified_Roots{K,j} = Root{1,j} ;
        end
        K = K + 1 ;
    end
end

%% Train

% Find the train accuracy to decide if new roots can cause better accuracy . 

[Number_of_Roots , ~] = size(Modified_Roots) ;
[Grouped_Data_Train,UnGrouped_Data_Train] = Grouping_Fcn(Modified_Roots,Data_Train,Features) ;
Labels = Label_Fcn(Grouped_Data_Train) ;

for i = 1 : Number_of_Roots
    Grouped_Data_Train(i,2) = Labels(i,1) ;
end

[Row_UnGrouped_Data_Train,~] = size(UnGrouped_Data_Train) ; % Number of the Ungrouped Data
if Row_UnGrouped_Data_Train ~= 0
    Roots_Features = Roots_Features_Fcn(Modified_Roots,Features) ;
    for i = 1 : Row_UnGrouped_Data_Train % Labelling the ungrouped data
        for j = 1 : 9
            Data{1,j} = UnGrouped_Data_Train{i,j} ; % Move each of the Ungrouped sample to find its label
        end
        UnGrouped_Data_Train{i,Number_of_Features+1} = Ungrouped_Label_Fcn(Data,Modified_Roots,Roots_Features,Labels) ; % Find the label for each of the ungrouped train sample
    end
end

Train_Accuracy = Accuracy_Fcn(Grouped_Data_Train,UnGrouped_Data_Train,Label_Column) ;

if Train_Accuracy >= Last_Train_Accuracy
    New_Roots = Modified_Roots ;
    New_Train_Accuracy = Train_Accuracy ;
else
    New_Roots = Roots ;
    New_Train_Accuracy = Last_Train_Accuracy ;
    Labels = Old_Labels ;
end

end