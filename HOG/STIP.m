% Store all input videos in folder DATA in .avi format with names class+number i.e boxing1.avi, boxing2,avi, ...
% A 3-D matrix indicating STIP points ('0' if yes,'1' if no) is
stored in a folder named 'STIP' .Set the 'number' and 'class' and create a folder by name 'STIP'in the workspace before running the code.

function STIP(class)
fprintf("In STIP")
    for i=1:3
        for j=1:2
            std=2^((i+1)/2);std_t=2^(j/2);
            [x,y,t] = meshgrid(-1:1,-1:1,-1:1);
            %x=gpuArray(x);
            %y=gpuArray(y);
            %t=gpuArray(t);
            arg   = -((x.*x + y.*y)/(2*std*std)) - (t.*t/(2*std_t*std_t));
            h(:,:,:,6*(j-1)+i) = exp(arg);
            % h(h<eps*max(h(:))) = 0;
            sumh = sum(sum(sum(h(:,:,:,6*(j-1)+i))));
            if sumh ~= 0,
            h(:,:,:,6*(j-1)+i) = h(:,:,:,6*(j-1)+i)/sumh;
            end
        end
    end
    %%
    clearvars x y
    for number=100:100  %set the index of the videos belonging to that particular class. STIPs of all the videos are evaluated in a single run.
        tic
        str = ['DATA\',class];
        str = [str,num2str(number)];
        str = [str,'.avi'];
        obj = VideoReader(str);
        nrows = obj.Height;
        ncols = obj.Width;
        video = read(obj);
        nframes = obj.NumberOfFrames;
        for i=1:nframes
            fr(:,:,i) = rgb2gray(video(:,:,:,i));
        end
        fr=gpuArray(fr);
        corner = ones(nrows,ncols,nframes,'gpuArray');
        for n=1:6
            frame = imfilter(fr, h(:,:,:,n));
            frame_x = cat(2,frame(:,2:ncols,:)-frame(:,1:ncols-1,:),zeros(nrows,1,nframes));
            frame_y = cat(1,zeros(1,ncols,nframes),frame(1:nrows-1,:,:)-frame(2:nrows,:,:));
            frame_t = cat(3,frame(:,:,2:nframes)-frame(:,:,1:nframes-1),zeros(nrows,ncols,1));
            frame_x2 = frame_x.*frame_x;frame_y2 = frame_y.*frame_y;frame_t2 = frame_t.*frame_t;
            frame_xy = frame_x.*frame_y;frame_yt = frame_y.*frame_t;frame_xt = frame_x.*frame_t;
            Ix2 = imfilter(frame_x2,h(:,:,:,n));
            %Ix2=gpuArray(Ix2);
            Iy2 = imfilter(frame_y2,h(:,:,:,n));
            %Iy2=gpuArray(Iy2);
            It2 = imfilter(frame_t2,h(:,:,:,n));
            %It2=gpuArray(It2);
            Ixy = imfilter(frame_xy,h(:,:,:,n));
            %Ixy=gpuArray(Ixy);
            Iyt = imfilter(frame_yt,h(:,:,:,n));
            %Iyt=gpuArray(Iyt);
            Ixt = imfilter(frame_xt,h(:,:,:,n));
            %Ixt=gpuArray(Ixt);
            clearvars frame_x2 frame_y2 frame_t2 frame_xy frame_yt frame_xt frame_x frame_y frame_t

            for i=1:nrows
                for j=1:ncols
                    for k=1:nframes
                        A = [Ix2(i,j,k) Ixy(i,j,k) Ixt(i,j,k);...
                             Ixy(i,j,k) Iy2(i,j,k) Iyt(i,j,k);...
                             Ixt(i,j,k) Iyt(i,j,k) It2(i,j,k)];
                        A = cast(A,'double');
                        Mc(i,j,k) = det(A) - 0.005*((trace(A))^3);
                    end
                end
            end
            clearvars Ix2 Iy2 It2 Ixy Iyt Ixt

            for i=2:nrows-1
                for j=2:ncols-1
                    for k=2:nframes-1
                        if ((max(max(max(Mc(i-1:i+1,j-1:j+1,k-1:k+1)))) == Mc(i,j,k)) && (Mc(i,j,k) > 10000))
                            corner(i,j,k) = 0;
                        end
                    end
                end
            end
        end
        time = toc;
        str = [['STIP\',class],num2str(number)];
        save(str,'corner','time');
        clearvars A Mc corner fr frame
    end
end