% Construct the histogram model for each of the videos

clc;
clear;

% Loading the cluster centers
load('clustering_information.mat');

% Constructing the Histogram for each video of class clap
class = 'clap';

for i=1:100
    str = [['SIFT1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(800,1);
    for j = 1:size(m,2)
        m1 = -1;
        dist_prev = pdist([C(1,:);m(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);m(:,j)'],'euclidean');
            if dist <= dist_prev 
                m1 = k;
                dist_prev = dist;
            end
        end
        hist(m1) = hist(m1) + 1; 
    end
    str = [['HIST1\',class],num2str(i)];
    save(str,'hist'); 
end


% Constructing the Histogram for each video of class running
class = 'running';

for i=1:100
    str = [['SIFT1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(800,1);
    for j = 1:size(m,2)
        m1 = -1;
        dist_prev = pdist([C(1,:);m(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);m(:,j)'],'euclidean');
            if dist <= dist_prev 
                m1 = k;
                dist_prev = dist;
            end
        end
        hist(m1) = hist(m1) + 1; 
    end
    str = [['HIST1\',class],num2str(i)];
    save(str,'hist'); 
end

% Constructing the Histogram for each video of class boxing
class = 'boxing';

for i=1:100
    str = [['SIFT1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(800,1);
    for j = 1:size(m,2)
        m1 = -1;
        dist_prev = pdist([C(1,:);m(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);m(:,j)'],'euclidean');
            if dist <= dist_prev 
                m1 = k;
                dist_prev = dist;
            end
        end
        hist(m1) = hist(m1) + 1; 
    end
    str = [['HIST1\',class],num2str(i)];
    save(str,'hist'); 
end


% Constructing the Histogram for each video of class waving
class = 'waving';

for i=1:100
    str = [['SIFT1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(800,1);
    for j = 1:size(m,2)
        m1 = -1;
        dist_prev = pdist([C(1,:);m(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);m(:,j)'],'euclidean');
            if dist <= dist_prev 
                m1 = k;
                dist_prev = dist;
            end
        end
        hist(m1) = hist(m1) + 1; 
    end
    str = [['HIST1\',class],num2str(i)];
    save(str,'hist'); 
end

% Constructing the Histogram for each video of class walking
class = 'walking';

for i=1:100
    str = [['SIFT1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(800,1);
    for j = 1:size(m,2)
        m1 = -1;
        dist_prev = pdist([C(1,:);m(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);m(:,j)'],'euclidean');
            if dist <= dist_prev 
                m1 = k;
                dist_prev = dist;
            end
        end
        hist(m1) = hist(m1) + 1; 
    end
    str = [['HIST1\',class],num2str(i)];
    save(str,'hist'); 
end


% Constructing the Histogram for each video of class jogging
class = 'jogging';

for i=1:100
    str = [['SIFT1\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(800,1);
    for j = 1:size(m,2)
        m1 = -1;
        dist_prev = pdist([C(1,:);m(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);m(:,j)'],'euclidean');
            if dist <= dist_prev 
                m1 = k;
                dist_prev = dist;
            end
        end
        hist(m1) = hist(m1) + 1; 
    end
    str = [['HIST1\',class],num2str(i)];
    save(str,'hist'); 
end