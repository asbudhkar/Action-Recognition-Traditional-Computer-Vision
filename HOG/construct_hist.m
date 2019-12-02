
% Construct the histogram model for each of the videos using the centroid clusters in the clustering_information.

clc;

% Loading the cluster centers
load('clustering_information.mat');

class = 'clap';
% Construct the Histogram for class = 'clap'
for i=1:100
    str = [['HOG\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    a=load(str);
    hist = zeros(1000,1;
    for j = 1:size(a.h,2)
        m = -1;
        dist_prev = pdist([C(1,:);a.h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);a.h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST\',class],num2str(i)];
    save(str,'hist'); 
end


% Construct the Histogram of class = 'running';
class = 'running';

for i=1:100
    str = [['HOG\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(100,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST\',class],num2str(i)];
    save(str,'hist'); 
end

% Construct the Histogram of class = 'boxing';
class = 'boxing';

for i=1:100
    str = [['HOG\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(100,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST\',class],num2str(i)];
    save(str,'hist'); 
end


% Construct the Histogram of class = 'waving';
class = 'waving';

for i=1:100
    str = [['HOG\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(100,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST\',class],num2str(i)];
    save(str,'hist'); 
end


% Construct the Histogram of class = 'walking';
class = 'walking';

for i=1:100
    str = [['HOG\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(100,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST\',class],num2str(i)];
    save(str,'hist'); 
end


% Construct the Histogram of class = 'jogging';
class = 'jogging';

for i=1:100
    str = [['HOG\',class],num2str(i)];
    fprintf('total out of %d\n',i);
    str = [str,'.mat'];
    load(str);
    hist = zeros(100,1);
    for j = 1:size(h,2)
        m = -1;
        dist_prev = pdist([C(1,:);h(:,j)'],'euclidean');
        for k = 1:size(C,1)
            dist = pdist([C(k,:);h(:,j)'],'euclidean');
            if dist <= dist_prev 
                m = k;
                dist_prev = dist;
            end
        end
        hist(m) = hist(m) + 1; 
    end
    str = [['HIST\',class],num2str(i)];
    save(str,'hist'); 
end