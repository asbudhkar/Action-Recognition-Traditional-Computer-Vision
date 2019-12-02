% Calculate SIFT descriptors for every action class in KTH dataset

total=100;

% This step computes the video frames of all the videos from "clap"
for i=1:total
    saving_video(i,'clap');
    fprintf('Completed Saving class 1 %d\n',i);
end

% This step computes the video frames of all the videos from "running"
for i=1:total
    saving_video(i,'running');
    fprintf('Completed Saving class 2 %d\n',i);
end

% This step computes the video frames of all the videos from "boxing"
for i=1:total
    saving_video(i,'boxing');
    fprintf('Completed Saving class 3 %d\n',i);
end

% This step computes the video frames of all the videos from "jogging"
for i=1:total
    saving_video(i,'jogging');
    fprintf('Completed Saving class 4 %d\n',i);
end

% This step computes the video frames of all the videos from "walking"
for i=1:total
    saving_video(i,'walking');
    fprintf('Completed Saving class 5 %d\n',i);
end

% This step computes the video frames of all the videos from "waving"
for i=1:total
    saving_video(i,'waving');
    fprintf('Completed Saving class 6 %d\n',i);
end

for i=1:total
    SIFT(i,'clap');
    fprintf("Class1 SIFT Done");
end

for i=1:total
    SIFT(i,'running');
    fprintf("Class2 SIFT Done");
end

for i=1:total
    SIFT(i,'boxing');
    fprintf("Class3 SIFT Done");
end

for i=1:total
    SIFT(i,'waving');
    fprintf("Class4 SIFT Done");
end

for i=1:total
    SIFT(i,'walking');
    fprintf("Class5 SIFT Done");
end

for i=1:total
    SIFT(i,'jogging');
    fprintf("Class6 SIFT Done");
end