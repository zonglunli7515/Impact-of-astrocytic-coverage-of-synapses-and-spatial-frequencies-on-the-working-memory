function [images] = load_images()
    params = model_parameters();
    images_dir = '../images';
    image_names = {
        'zero.jpg', ...
        'one.jpg', ...
        'two.jpg', ...
        'three.jpg', ...
        'four.jpg', ...
        'five.jpg', ...
        'six.jpg', ...
        'seven.jpg', ...
        'eight.jpg', ...
        'nine.jpg'
    };
    images = {};
    count = 0;
    for name = image_names
        count = count + 1;
        image = imread(fullfile(images_dir, name{1}));
        image = rgb2gray(image);
        if params.mneuro == 79
            images{count} = image;
        end
        if params.mneuro == 81
             image(80,:) = 255;
             image(:,80) = 255;
             image = [zeros(80,1)+255, image];
             image = [zeros(1,81)+255; image];
             images{count} = image;
        end
        if params.mneuro == 78
            image(1,:) = [];
            image(:,1) = [];
            images{count} = image;
        end
    end
end
