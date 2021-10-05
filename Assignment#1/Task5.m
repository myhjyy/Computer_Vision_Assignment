if exist('Task4', 'dir')
    list = dir('data/data');
    for i=3:size(list, 1)
        image_name = extractBefore(list(i).name, '.jpg');
        disp(append("image name :", image_name));
        image_r = imread(append('Task4/',image_name,'_red.jpg'));
        image_g = imread(append('Task4/',image_name,'_green.jpg'));
        image_b = imread(append('Task4/',image_name,'_blue.jpg'));

        % red color base
        dist_rg = image_dist(image_r, image_g);
        dist_rb = image_dist(image_r, image_b);
        % disp(append("dist_rg : ", num2str(dist_rg)));
        % disp(append("dist_rb : ", num2str(dist_rb)));
        base_r = cat(3, image_r, circshift(image_g, dist_rg), circshift(image_b, dist_rb));

        % green color base
        dist_gr = image_dist(image_g, image_r);
        dist_gb = image_dist(image_g, image_b);
        disp(append("dist_gr : ", num2str(dist_gr)));
        disp(append("dist_gb : ", num2str(dist_gb)));
        base_g = cat(3, circshift(image_r, dist_gr), image_g, circshift(image_b, dist_gb));

        % blue color base
        dist_br = image_dist(image_b, image_r);
        dist_bg = image_dist(image_b, image_g);
        % disp(append("dist_br : ", num2str(dist_br)));
        % disp(append("dist_bg : ", num2str(dist_bg)));
        base_b = cat(3, circshift(image_r, dist_br), circshift(image_b, dist_bg), image_b);

        if exist('Task5', 'dir') == 0
            mkdir('Task5')
        end
        imwrite(base_r, append('Task5/',image_name,'_red_base.jpg'));
        imwrite(base_g, append('Task5/',image_name,'_green_base.jpg'));
        imwrite(base_b, append('Task5/',image_name,'_blue_base.jpg'));
    end
else
    disp("You SHOULD execute previous tasks first!!");
end

function result = image_dist(base, sub)
    norm = normxcorr2(sub, base);
    [y, x] = find(norm==max(norm(:)));
    dist_y = y-size(sub, 1);
    dist_x = x-size(sub, 2);
    result = [dist_x dist_y];
end
    