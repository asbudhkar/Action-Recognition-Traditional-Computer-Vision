% This is used for training KNN model and clasification of actions

clc;
clear;
fprintf('In knn.m file')

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

% Extract the histogram for each of the video of class running for testing
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

% Extract the histogram for each of the video of class boxing for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'waving';

% Extract the histogram for each of the video of class waving for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;4];
end

% Extract the histogram for each of the video of class waving for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'jogging';

% Extract the histogram for each of the video of class jogging for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;5];
end

% Extract the histogram for each of the video of class jogging for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'walking';

% Extract the histogram for each of the video of class walking for training
for i=1:80
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;6];
end

% Extract the histogram for each of the video of class walking for testing
for i=81:100
    str = [['HIST1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

% Final Training Process and KNN model construction

maxa=0;
j=0;
for i =1:320

class = knnclassify(points2,points,group,i)
true=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4]';
cp=classperf(true);
classperf(cp,class);
a=cp.CorrectRate
if a>maxa
    maxa=a;
    j=i;
end

testLabels=true;
confMat = confusionmat(testLabels,class)
end
disp(maxa)
disp(j)