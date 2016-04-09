function [X y] = trainEmail(mail_directory, is_spam)
    filelist_spam = readdir (mail_directory);
    n = 1899;
    X = [];

    % Load Vocabulary
    vocabStruct = getVocabStruct();
    for i = 1:numel(filelist_spam)
        if (regexp (filelist_spam{i}, "^\\.\\.?$"))
            continue;
        endif
        file_contents = readFile(strcat('./',mail_directory,'/',filelist_spam{i}));
        % t=cputime;
        word_indices  = processEmail(file_contents, vocabStruct);
        % printf('CPU time process: %f seconds\n', cputime-t);
        % Extract features.  Converts email into a vector of features in R^n.
        features = emailFeatures(word_indices);
        X = [features; X];
    endfor
    if is_spam
        y = ones(rows(X),1);
    else
        y = zeros(rows(X),1);
    endif
end