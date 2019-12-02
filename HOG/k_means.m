% Construct the bag of words model from all videos of all classes

clc;
clear;

X = [];

% Collecting the HOG features from class = 'clap';

parfor i=1:80
    str = [['HOG\',class],num2str(i)];
    str = [str,'.mat'];
    a=load(str);
    X = [X a.h];
    fprintf('clapping loading %d \n',i);
end

fprintf('clap loaded \n');

%Collecting the HOG features from class = "running"
class = 'running';

parfor i=1:80
    str = [['HOG\',class],num2str(i)];
    str = [str,'.mat'];
    a=load(str);
    X = [X a.h];
    fprintf('running loading %d \n',i);
end

fprintf('running loaded \n');


%Collecting the HOG features from class = "boxing"

class = 'boxing';

parfor i=1:80
    str = [['HOG\',class],num2str(i)];
    str = [str,'.mat'];
    a=load(str);
    X = [X a.h];
    fprintf('boxing loading %d \n',i);
end

fprintf('boxing loaded \n');


%Collecting the HOG features from class = "waving"
class = 'waving';

parfor i=1:80
    str = [['HOG\',class],num2str(i)];
    str = [str,'.mat'];
    a=load(str);
    X = [X a.h];
    fprintf('waving loading %d \n',i);
end

fprintf('waving loaded \n');


%Collecting the HOG features from class = "jogging"
class = 'jogging';

parfor i=1:80
    str = [['HOG\',class],num2str(i)];
    str = [str,'.mat'];
    a=load(str);
    X = [X a.h];
    fprintf('jogging loading %d \n',i);
end

fprintf('jogging loaded \n');


%Collecting the HOG features from class = "walking"

class = 'walking';

parfor i=1:80
    str = [['HOG\',class],num2str(i)];
    str = [str,'.mat'];
    a=load(str);
    X = [X a.h];
    fprintf('walking loading %d \n',i);
end

fprintf('walking loaded \n');
% Applying K means algorithm to contruct the 50 centroid points.
k = 1000;
[IDX,C] = kmeans(X',k,'Maxiter',1000);
save('clustering_information.mat','C');