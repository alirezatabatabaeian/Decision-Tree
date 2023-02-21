%% Clear

close all ; clear ; clc ; % Clear every thing

%% Train & Test Data Read

Data_Train = Data_Read("adult.train.10k.txt") ; % Read the train file

Features = Find_Features(Data_Train) ; % Find all the available features

Percentage_of_the_Train_Data = 75 ; % Define the percentage of the needed data

[Data_Train , Data_Test] = Choose_Data_Randomly(Data_Train,Percentage_of_the_Train_Data) ; % Choose P percent of the train data randomly 

Data_Test_two = Data_Read("adult.test.10k.txt") ; % Read the test file

%% Initial Patameters Definition

[Number_of_Samples , Number_of_features] = size(Data_Train) ; % Find number of samples & features

Number_of_all_values = 2 + 7 + 16 + 7 + 14 + 6 + 5 + 2 + 40 ; % Define the number of all values of all features

My_Label_Column = 10 ; % Number of column of new labels

Matrix = zeros(Number_of_Samples , Number_of_all_values) ; % Define a matrix for next uses

Data = cell(1,9) ; % Define a vector for next uses

%% Find the Root

for Row = 1 : Number_of_Samples % Find the root for each sample
    if Matrix(Row,2) == 0 % If the sample has a root , skip it .
       for Try = 1 : Number_of_features-1 % At most 8 times of rooting for each sample
           if Matrix(Row,2) == 0 % If the sample has a root , skip it .
              Row_Matrix = Sames(Matrix,Row) ; % Find the same samples for finding the IG and the best feature
              Number_of_Feature_with_the_highest_IG = Max_IG(Data_Train,Row_Matrix,Number_of_Samples,Number_of_features) ; % Find the feature with the highest Information Gain
              Matrix = Classifier(Data_Train,Matrix,Row_Matrix,Number_of_Feature_with_the_highest_IG,Features) ; % Classify the same samples according to the best feature
           end % Finish the if condition
       end % Finish the for loop
    end % Finish the if condition
end % Finish the for loop

UnSames_Matrix = UnSame(Matrix) ; % Find the different ways(Roots)

Roots = Root_Finder(UnSames_Matrix) ; % Define a dictionary to convert the ways to values

[Number_of_the_Roots , ~] = size(Roots) ; % Number of the roots

Roots_Before_Pruning = Roots ; % Save the roots before pruning

Tree_Size = Size_of_Tree(Roots) ; % Define the Size of the tree

%% Train & Test Data Grouping

[Grouped_Data_Train,UnGrouped_Data_Train] = Grouping_Fcn(Roots,Data_Train,Features) ; % Grouping the train samples according to roots matrix

[Grouped_Data_Test ,UnGrouped_Data_Test ] = Grouping_Fcn(Roots,Data_Test ,Features) ; % Grouping the test samples according to roots matrix

%% Train & Test Data Labelling

Labels = Label_Fcn(Grouped_Data_Train) ; % Find the labels of the roots

Roots_Features = Roots_Features_Fcn(Roots,Features) ; % Define a Matrix containing the features number according to roots

for i = 1 : Number_of_the_Roots % Labelling the Train Data 
    Grouped_Data_Train(i,2) = Labels(i,1) ;
end

for i = 1 : Number_of_the_Roots % Labelling the Test Data 
    Grouped_Data_Test(i,2) = Labels(i,1) ;
end

% There are samples in test data which has no pre-defined root so they have
% to be labeled according to the most common label in their neighbourhoods

[Row_UnGrouped_Data_Test,~] = size(UnGrouped_Data_Test) ; % Number of the Ungrouped Data

for i = 1 : Row_UnGrouped_Data_Test % Labelling the ungrouped data
    for j = 1 : 9
        Data{1,j} = UnGrouped_Data_Test{i,j} ; % Move each of the Ungrouped sample to find its label
    end
    UnGrouped_Data_Test{i,Number_of_features+1} = Ungrouped_Label_Fcn(Data,Roots,Roots_Features,Labels) ; % Find the label for each of the ungrouped train sample
end

%% Find Train & Test Accuracy

Train_Accuracy = Accuracy_Fcn(Grouped_Data_Train,UnGrouped_Data_Train,My_Label_Column) ; % Find the accuracy of the train samples

Train_Accuracy % Print the accuracy of the train samples

Test_Accuracy  = Accuracy_Fcn(Grouped_Data_Test,UnGrouped_Data_Test,My_Label_Column) ; % Find the accuracy of the test samples

Test_Accuracy % Print the accuracy of the test samples

%% Pruning

% for i = 1 : 50 % Prune the tree
%     [Roots , Train_Accuracy , Labels] = Pruning_Fcn(Data_Train,Roots,i,Features,Train_Accuracy,Labels) ; % Pruning Function
%     i
%     Train_Accuracy
% end

%% Pruning for ب part a

for i = 1 : 50 % Prune the tree
    [Roots , Test_Accuracy , Labels] = Pruning_Fcn(Data_Test,Roots,i,Features,Test_Accuracy,Labels) ; % Pruning Function
    [Grouped_Data_Test , UnGrouped_Data_Test] = Grouping_Fcn(Roots,Data_Test_two,Features) ;
    Roots_Features = Roots_Features_Fcn(Roots,Features) ;
    [Number_of_the_Roots , ~] = size(Roots) ;

    for k = 1 : Number_of_the_Roots
        Grouped_Data_Test(k,2) = Labels(k,1) ;
    end

    [Row_UnGrouped_Data_Test,~] = size(UnGrouped_Data_Test) ;

    for k = 1 : Row_UnGrouped_Data_Test
        for j = 1 : 9
            Data{1,j} = UnGrouped_Data_Test{k,j} ;
        end
        UnGrouped_Data_Test{k,Number_of_features+1} = Ungrouped_Label_Fcn(Data,Roots,Roots_Features,Labels) ;
    end

    Test_Accuracy_two  = Accuracy_Fcn(Grouped_Data_Test,UnGrouped_Data_Test,My_Label_Column) ;
    
    i
    Test_Accuracy
    Test_Accuracy_two
    A(1,i) = Test_Accuracy ;
    A(2,i) = Test_Accuracy_two ;
    
end

%% Group Test Data & Find Accuracy After Pruning

%Find the accuracy of the test data on pruned tree

% [Grouped_Data_Test , UnGrouped_Data_Test] = Grouping_Fcn(Roots,Data_Test_two,Features) ;
% Roots_Features = Roots_Features_Fcn(Roots,Features) ;
% [Number_of_the_Roots , ~] = size(Roots) ;
% 
% for i = 1 : Number_of_the_Roots
%     Grouped_Data_Test(i,2) = Labels(i,1) ;
% end
% 
% [Row_UnGrouped_Data_Test,~] = size(UnGrouped_Data_Test) ;
% 
% for i = 1 : Row_UnGrouped_Data_Test
%     for j = 1 : 9
%         Data{1,j} = UnGrouped_Data_Test{i,j} ;
%     end
%     UnGrouped_Data_Test{i,Number_of_features+1} = Ungrouped_Label_Fcn(Data,Roots,Roots_Features,Labels) ;
% end
% 
% Test_Accuracy  = Accuracy_Fcn(Grouped_Data_Test,UnGrouped_Data_Test,My_Label_Column) ;
% 
% Test_Accuracy



%% Clear unUsable Variables

clear Data Data_Test Data_Train Features i j Labels Matrix My_Label_Column Number_of_all_values ... % Clear all unnecessary variables 
      Number_of_Feature_with_the_highest_IG Number_of_features Number_of_Roots Number_of_Samples ...
      Roots_Features Row Row_Matrix Row_UnGrouped_Data_Test Try UnGrouped_Data_Train UnSames_Matrix ...
