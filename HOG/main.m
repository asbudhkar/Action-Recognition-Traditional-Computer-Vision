% Calculate HOG descriptors for every action class in KTH dataset

total =100;
% 80 are train videos and 20 are test videos

%This step computes the Spatio Temporal Interest Points 
STIP('clap');
fprintf('Completed STIP class 1 %d\n',i);

STIP('running');
fprintf('Completed STIP class 2 %d\n',i);

STIP('boxing');
fprintf('Completed STIP class 3 %d\n',i);

STIP('waving');
fprintf('Completed STIP class 4 %d\n',i);

STIP('jogging');
fprintf('Completed STIP class 5 %d\n',i);

STIP('walking');
fprintf('Completed STIP class 6 %d\n',i);

% This step computes the video frames of all the videos from "clapping"
for i=1:total
    saving_video(i,'clap');
    fprintf('Completed Saving class 1 %d\n',i);
end

% Get the HOG features 
for i=1:total
    Collecting_HOG(i,'clap');
    fprintf('Completed HOG class 1 %d\n',i);
end


% This step computes the video frames of all the videos from "running"
for i=1:total
    saving_video(i,'running');
    fprintf('Completed Saving class 2 %d\n',i);
end

% Get the HOG features
for i=1:total
    Collecting_HOG(i,'running');
    fprintf('Completed Saving class 2 %d\n',i);
end


% This step computes the video frames of all the videos from "boxing"
for i=1:total
    saving_video(i,'boxing');
    fprintf('Completed Saving class 3 %d\n',i);
end

% Get the HOG features 
for i=1:total
    Collecting_HOG(i,'boxing');
    fprintf('Completed HOG class 3 %d\n',i);
end


% This step computes the video frames of all the videos from "waving"
for i=1:total
    saving_video(i,'waving');
    fprintf('Completed Saving class 4 %d\n',i);
end

% Get the HOG features 
for i=1:total
    Collecting_HOG(i,'waving');
    fprintf('Completed Saving class 4 %d\n',i);
end

% This step computes the video frames of all the videos from "jogging"
for i=1:total
    saving_video(i,'jogging');
    fprintf('Completed Saving class 5 %d\n',i);
end

% Get the HOG features 
for i=1:total
    Collecting_HOG(i,'jogging');
    fprintf('Completed HOG class 6 %d\n',i);
end


% This step computes the video frames of all the videos from "walking"
for i=1:total
    saving_video(i,'walking');
    fprintf('Completed Saving class 5 %d\n',i);
end

% Get the HOG features 
for i=1:total
    Collecting_HOG(i,'walking');
    fprintf('Completed Saving class 6 %d\n',i);
end

toc