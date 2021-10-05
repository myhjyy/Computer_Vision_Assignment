if exist('Task1/task1_red.jpg', 'file') && exist('Task1/task1_green.jpg', 'file') && exist('Task1/task1_blue.jpg', 'file')
    
    channel_r = imread("Task1/task1_red.jpg");
    channel_g = imread("Task1/task1_green.jpg");
    channel_b = imread("Task1/task1_blue.jpg");
    
    filter_r = [0.25 0.5 0.25; 0.5 1 0.5; 0.25 0.5 0.25];
    filter_g = [0 0.25 0; 0.25 1 0.25; 0 0.25 0];
    filter_b = filter_r;
    
    implement_r = imfilter(channel_r, filter_r);
    implement_g = imfilter(channel_g, filter_g);
    implement_b = imfilter(channel_b, filter_b);
    
    if exist('Task2', 'dir') == 0
        mkdir('Task2')
    end
    
    imwrite(implement_r, 'Task2/task2_red.jpg');
    imwrite(implement_g, 'Task2/task2_green.jpg');
    imwrite(implement_b, 'Task2/task2_blue.jpg');
else
    disp("You SHOULD execute previous tasks first!!");
end
