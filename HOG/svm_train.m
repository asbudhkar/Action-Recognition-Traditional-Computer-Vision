
% Train SVM model
clc;
clear;


class = 'clap';

points = [];
group = [];

points2 = [];


% This part is used to extract the histogram for each of the video of class
% "clap" for training
parfor i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points = [points;a.hist'];
    group = [group;1];
end

% This part is used to extract the histogram for each of the video of class
% "running" for testing
parfor i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points2 = [points2;a.hist'];
end

class = 'running';

% This part is used to extract the histogram for each of the video of class
% "Talking on a phone" for training
parfor i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points = [points;a.hist'];
    group = [group;2];
end


% This part is used to extract the histogram for each of the video of class
% "talking on a phone" for testing
parfor i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points2 = [points2;a.hist'];
end

class = 'boxing';

% This part is used to extract the histogram for each of the video of class
% "clap" for training
parfor i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points = [points;a.hist'];
    group = [group;3];
end

% This part is used to extract the histogram for each of the video of class
% "running" for testing
parfor i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points2 = [points2;a.hist'];
end

class = 'waving';

% This part is used to extract the histogram for each of the video of class
% "Talking on a phone" for training
parfor i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points = [points;a.hist'];
    group = [group;4];
end


% This part is used to extract the histogram for each of the video of class
% "talking on a phone" for testing
parfor i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points2 = [points2;a.hist'];
end

class = 'jogging';

% This part is used to extract the histogram for each of the video of class
% "Talking on a phone" for training
parfor i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points = [points;a.hist'];
    group = [group;5];
end


% This part is used to extract the histogram for each of the video of class
% "talking on a phone" for testing
parfor i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points2 = [points2;a.hist'];
end

class = 'walking';

% This part is used to extract the histogram for each of the video of class
% "Talking on a phone" for training
parfor i=1:80
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points = [points;a.hist'];
    group = [group;6];
end


% This part is used to extract the histogram for each of the video of class
% "talkng on a phone" for testing
parfor i=81:100
    str = [['HIST\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    points2 = [points2;a.hist'];
end


% Final Training Process and constructing a SVM

classifier = fitcecoc(points, group);
CVSVMModel = crossval(classifier);

j=0;
maxa=0;
for i=1:10


FirstModel = CVSVMModel.Trained{i}
predictedLabels = predict(FirstModel, points2);
disp(predictedLabels)

true=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 ]';

%true=[1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 5 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6 6]';

cp=classperf(true);

classperf(cp,predictedLabels);
a=cp.CorrectRate
if(a>maxa)
    maxa=a;
    j=i;
end
confMat = confusionmat(true,predictedLabels)
end
disp(maxa)
disp(j)