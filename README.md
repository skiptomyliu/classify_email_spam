# Extension of Coursera's Machine Learning Support Vector Machine for spam classification

### Additions:
 - Small python script to strip headers from e-mails.  Sample spam emails are from spamassassin.
 - create_training_samples.m creates our own training and cross validation.  Saves to trainingSamples.mat and trainingTests.mat.
 - Small changes to getVocab to return both struct and list for 
   	improvements in performance rather than iterating over 1899 features (n) to do a lookup.