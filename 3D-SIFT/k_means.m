% Contruct the bag of word model from the desccriptors from all the videos from all the classes

clc;
clear;
X = [];

% Collecting the SIFT features from all the videos belonging to the clapping class
class = 'clap';

for i=1:80
    str = [['SIFT1\',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X m];
end

fprintf('clap loaded \n');

% Collecting all the SIFT features from all the videos belonging to the running class
class = 'running';

for i=1:80
    str = [['SIFT1\',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X m];
end

fprintf('running loaded \n');

% Collecting the SIFT features from all the videos belonging to the boxing class
class = 'boxing';

for i=1:80
    str = [['SIFT1\',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X m];
end

fprintf('boxing loaded \n');

% Collecting the SIFT features from all the videos belonging to the waving class
class = 'waving';

for i=1:80
    str = [['SIFT1\',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X m];
end

fprintf('waving loaded \n');

% Collecting the SIFT features from all the videos belonging to the walking class
class = 'walking';

for i=1:80
    str = [['SIFT1\',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X m];
end

fprintf('walking loaded \n');

% Collecting the SIFT features from all the videos belonging to the jogging class
class = 'jogging';

for i=1:80
    str = [['SIFT1\',class],num2str(i)];
    str = [str,'.mat'];
    load(str);
    X = [X m];
end

fprintf('jogging loaded \n');

% Applying K means algorithm to contruct the k centroid points.
k = 800;
[IDX,C] = kmeans(X',k,'Maxiter',1000);
clustering_information.mat=C;
save('clustering_information.mat','C');