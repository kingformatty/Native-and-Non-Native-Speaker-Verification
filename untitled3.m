% This MATLAB footprint is to using MATLAB built in function to train an
% SVM classifier using the ranked feature map we generated before. We will
% test how the model performed by using only the first several ranked
% features.
[X_train,Y_train,X_test,Y_test] = split_train_test(feat_vec,labels,2,0.8);
Y_train(Y_train==0)=-1;
Y_test(Y_test==0)=-1;
% number of features
numF = size(X_train,2);



[ ranking , w] = mutInfFS( X_train, Y_train, numF );
k = 5; % select the Top 5 features
svmStruct = fitcsvm(X_train(:,ranking(1:k)),Y_train);
C = predict(svmStruct,X_test(:,ranking(1:k)));
err_rate = sum(Y_test~= C)/size(X_test,1); % mis-classification rate
conMat = confusionmat(Y_test,C); % the confusion matrix
fprintf('\nAccuracy: %.2f%%, Error-Rate: %.2f \n',100*(1-err_rate),err_rate);