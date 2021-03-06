function [vocabStruct,vocabList] = getVocabStruct()
%GETVOCABLIST reads the fixed vocabulary list in vocab.txt and returns a
%cell array of the words
%   vocabList = GETVOCABLIST() reads the fixed vocabulary list in vocab.txt 
%   and returns a cell array of the words in vocabList.


%% Read the fixed vocabulary list
fid = fopen('vocab.txt');

% Store all dictionary words in cell array vocab{}
n = 1899;  % Total number of words in the dictionary

vocabStruct = struct();
vocabList = cell(n, 1);
for i = 1:n
    % Word Index (can ignore since it will be = i)
    fscanf(fid, '%d', 1);
    % Actual Word
    word = fscanf(fid, '%s', 1);
    vocabStruct.(word) = i;    % key = word, value=index. 
                                % "machine":1
    vocabList{i} = word;
end
fclose(fid);

end
