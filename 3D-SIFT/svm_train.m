% File for training the dataset and constructing a SVM.
clc;
clear;

points = [];
group = [];
points2 = [];

class = 'clap';

% Extract the histogram for each of the video of class clap for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;1];
end

% Extract the histogram for each of the video of class clap for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'running';

% Extract the histogram for each of the video of class running for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;2];
end


% Extract the histogram for each of the video of class running for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'boxing';

% Extract the histogram for each of the video of class boxing for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;3];
end

% This part is used to extract the histogram for each of the video of class boxing for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'waving';

% This part is used to extract the histogram for each of the video of class waving for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;4];
end


% This part is used to extract the histogram for each of the video of class waving for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

% Extract the histogram for each of the video of class jogging for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;5];
end

% This part is used to extract the histogram for each of the video of class jooging for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'walking';

% This part is used to extract the histogram for each of the video of class walking for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;6];
end

% This part is used to extract the histogram for each of the video of class walking for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

% Final Training Process and constructing a SVM
% svm_var = svmtrain(points,group);
% results = multisvm(points,group,points2);
% disp(results)
classifier = fitcecoc(points, group);
predictedLabels = predict(classifier, points2);
disp(predictedLabels)
true=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4]';
cp=classperf(true);
% Checking for the classes of the test videos
% var_ans = svmclassify(svm_var,points2);
%% 
% var_ans = svmclassify(svm_var,points2,'Showplot',true)

classperf(cp,predictedLabels);
cp.CorrectRate
confMat = confusionmat(true,predictedLabels)
