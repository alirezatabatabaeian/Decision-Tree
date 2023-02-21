function [Data] = Data_Read(Address)

% This Function reads the .discrete file which are converted to .txt files .

fileID = fopen(Address) ; % open the train file
Data = textscan(fileID , '%s' , 'delimiter' , ',') ; % read the train file
Data = reshape(Data{1} , 9 , 10000)' ; % ReShape the data in a better form
fclose(fileID) ; % close the train file

end

