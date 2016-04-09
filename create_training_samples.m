
%% Initialization
clear ; close all; clc

%% ==================== Part 1: Email Preprocessing ====================
%  To use an SVM to classify emails into Spam v.s. Non-Spam, you first need
%  to convert each email into a vector of features. In this part, you will
%  implement the preprocessing steps for each email. You should
%  complete the code in processEmail.m to produce a word indices vector
%  for a given email.


printf('Creating training samples and training tests.  This will take approximately 5-10 minutes. \n')
% Create training samples
[X_s,y_s] = trainEmail('scrubbed_spam', 1);
printf('Done creating spam samples.  Now creating non-spam samples\n')
[X_h,y_h] = trainEmail('scrubbed_ham', 0);
printf('Done creating non-spam samples.\n')
X = [X_s; X_h];
y = [y_s; y_h];

% Save the training samples:
save('trainingSamples.mat', 'X','y');

printf('Creating spam cross-validation samples\n')
% Create cross validation samples
[X_s_test,y_s_test] = trainEmail('scrubbed_spam_cv', 1);
Xtest = X_s_test;
ytest = y_s_test;
save('trainingTests.mat', 'Xtest','ytest');
printf('Done. \n')