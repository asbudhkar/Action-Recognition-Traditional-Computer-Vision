% constructing a KNN model

clc;
clear;

%load('clustering_information.mat');

class = 'clap';

points = [];
group = [];

points2 = [];



% Extract the histogram for each of the video of class clap for training
for i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;1];
end

% Extract the histogram for each of the video of class clap for testing
for i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'running';

% Extract the histogram for each of the video of class running for training
for i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;2];
end


% Extract the histogram for each of the video of class running for testing
for i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'boxing';

% Extract the histogram for each of the video of class boxing for training
for i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;3];
end

% Extract the histogram for each of the video of class boxing for testing
for i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

% Extract the histogram for each of the video of class waving for training
class = 'waving';

for i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;4];
end

% Extract the histogram for each of the video of class waving for testing
for i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end


class = 'jogging';

% Extract the histogram for each of the video of class jogging for training
for i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;5];
end

% Extract the histogram for each of the video of class jogging for testing
for i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

class = 'walking';

% Extract the histogram for each of the video of class walking for training
for i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points = [points;hist'];
    group = [group;6];
end

% Extract the histogram for each of the video of class walking for testing
for i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    points2 = [points2;hist'];
end

maxa=0;
j=0
l=0;
confmat1=zeros(4,4);
%class = knnclassify(points2,points,group,38);

for k=1:10
mdl = fitcknn(points,group,'NumNeighbors',k);

CVKNNModel=crossval(mdl);

for i=1:10
FirstModel = CVKNNModel.Trained{i}

predictedLabels = predict(FirstModel, points2);
disp(predictedLabels)

true=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 ]';

%true=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6]'

cp=classperf(true);

classperf(cp,predictedLabels);
a=cp.CorrectRate
confMat = confusionmat(true,predictedLabels)
if(a>maxa)
    maxa=a;
    j=i;
    l=k;
    confmat1=confMat;
    
end

end
end
disp(maxa)
disp(j)
disp(l)
disp(confmat1)
%helperDisplayConfusionMatrix(confMat)


