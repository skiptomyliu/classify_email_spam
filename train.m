%% Extension of Coursera's Machine Learning Support Vector Machine
%%
%% Additions:
%% - create_training_samples.m creates our own training and cross validation
%%	 	samples from spamhaus
%% - Small changes to getVocab to return both struct and list for 
%%   	improvements in performance
%% Initialization
clear ; close all; clc

% Load training sample and cross validation tests
% Load into X, y
load('trainingSamples.mat') 

C = 0.1;
model = svmTrain(X, y, C, @linearKernel);

p = svmPredict(model, X);
fprintf('Training Accuracy: %f\n', mean(double(p == y)) * 100);


% Test against cross validation 
% Load into Xtest, ytest 
load('trainingTests.mat')
fprintf('\nEvaluating the trained Linear SVM on a test set ...\n')
p = svmPredict(model, Xtest);
fprintf('Test Accuracy: %f\n', mean(double(p == ytest)) * 100);
% pause;

% %% ================= Part 5: Top Predictors of Spam ====================
% %  Since the model we are training is a linear SVM, we can inspect the
% %  weights learned by the model to understand better how it is determining
% %  whether an email is spam or not. The following code finds the words with
% %  the highest weights in the classifier. Informally, the classifier
% %  'thinks' that these words are the most likely indicators of spam.
% %
% % Sort the weights and obtain the vocabulary list
[weight, idx] = sort(model.w, 'descend');

[vocabStruct,vocabList] = getVocabStruct();

fprintf('\nTop predictors of spam: \n');
for i = 1:15
    fprintf(' %-15s (%f) \n', vocabList{idx(i)}, weight(i));
end
% %% =================== Part 6: Try Your Own Emails =====================

% % Read and predict
filename = 'spamSample1.txt';
file_contents = readFile('spamSample1.txt');
word_indices  = processEmail(file_contents, vocabStruct);
x             = emailFeatures(word_indices);
p = svmPredict(model, x);

fprintf('\nProcessed %s\n\nSpam Classification: %d\n', filename, p);
fprintf('(1 indicates spam, 0 indicates not spam)\n\n');

