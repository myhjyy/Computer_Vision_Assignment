list = dir('data/data');

for i = 3:size(list, 1)
    image_name = extractBefore(list(i).name, '.jpg');
    image = imread(append('data/data/',list(i).name));
    
    image_b = imcrop(image, [0 0 size(image, 2) 340]);
    image_g = imcrop(image, [0 341 size(image, 2) 339]);
    image_r = imcrop(image, [0 681 size(image, 2) 339]);

    if exist('Task4', 'dir') == 0
        mkdir('Task4');
    end
    imwrite(image_b, append('Task4/', image_name, '_blue.jpg'));
    imwrite(image_g, append('Task4/', image_name, '_green.jpg'));
    imwrite(image_r, append('Task4/', image_name, '_red.jpg'));
end
