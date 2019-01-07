function [ output_args ] = SIFT( number,class )
%SIFT
str = [['Videos\',class],num2str(number)];
str = [str,'.mat'];

% load video
load(str,'frame')
load('DemoData.mat');
clear keys
offset = 0;
m=zeros(50,640);

% Generate 50 descriptors at locations given by subs matrix
for i=1:50
    reRun = 1;
    while reRun == 1
        loc = subs(i+offset,:);
        fprintf(1,'Calculating keypoint at location (%d, %d, %d)\n',loc);
        
        % Create a 3DSIFT descriptor at the given location
        [keys{i} reRun] = Create_Descriptor(frame,1,1,loc(1),loc(2),loc(3));
        
        if reRun == 1
            offset = offset + 1;
        end       
    end
    
    m(i,:)=keys{1,i}.ivec;
    
    % Save descriptor for video
    str = [['SIFT1\',class],num2str(number)];
    save(str,'m');
end

fprintf(1,'\nFinished...\n%d points thrown out do to poor descriptive ability.\n',offset);
end