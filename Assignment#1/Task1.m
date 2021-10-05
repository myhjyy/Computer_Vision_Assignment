mosaic = imread("data/mosaic/crayons_mosaic.bmp");
h = size(mosaic, 1);
w = size(mosaic, 2);

repmat_r = uint8(repmat([1 0; 0 0], (h/2), (w/2)));
repmat_g = uint8(repmat([0 1; 1 0], (h/2), (w/2)));
repmat_b = uint8(repmat([0 0; 0 1], (h/2), (w/2)));

channel_r = mosaic.*repmat_r;
channel_g = mosaic.*repmat_g;
channel_b = mosaic.*repmat_b;

if exist('Task1', 'dir') == 0
    mkdir('Task1');
end
imwrite(channel_r, 'Task1/task1_red.jpg');
imwrite(channel_g, 'Task1/task1_green.jpg');
imwrite(channel_b, 'Task1/task1_blue.jpg');