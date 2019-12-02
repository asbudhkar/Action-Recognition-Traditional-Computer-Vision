% Set the 'number' and 'class' and create a folder by name 'Videos' in the codebase before running the code.
% Saves the video as a 3-D matrix in a folder named 'Videos'.

function saving_video(number,class)
    
    str = [['DATA\',class],num2str(number)];
    str = [str,'.avi'];
    obj = VideoReader(str);
    video = read(obj);
    %video=gpuArray(video);
    nframes = obj.NumberOfFrames;
    %%
    parfor i=1:nframes
        frame(:,:,i) = rgb2gray(video(:,:,:,i));
    end
    str = [['Videos\',class],num2str(number)];
    save(str,'frame');
end