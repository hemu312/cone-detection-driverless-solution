clear;
%% 
% vidout = VideoWriter('output1.mj2','Motion JPEG 2000'); vidout.FrameRate = 
% 50; %vidout.Quality = 100; open(vidout)

figure
for i = 1:1.6:1664
    frame = imread(sprintf('./output/frame_%04d.jpg', floor(i)));
    imshow(frame)
    %vidout.writeVideo(frame);
    %disp(i)
end
%%
for i = 1:1664
    frame = imread(sprintf('./output/frame_%04d.jpg', i));
    frame1 = imresize(frame, 0.25);
    file_out = sprintf('./output1/frame_%04d.jpg', i);
    imwrite(frame1, file_out);
end
%%
for i = 1:1664
    frame = imread(sprintf('./output1/frame_%04d.jpg', i));
    a(:,:,:,i) = frame;
end
%%
%j = 3;
for i = 1:7:1664
    frame = imread(sprintf('./output/frame_%04d.jpg', i));
    frame1 = imcrop(frame, [281,1,719,719]);
    imshow(frame1)
end

%%
v = VideoWriter('./output1.avi', 'Uncompressed AVI');
open(v)
for i = 1:34:1664
    frame = imread(sprintf('./output/frame_%04d.jpg', i));
    v.writeVideo(imresize(frame,0.5));
end
close(v)