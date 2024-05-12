% Image and Video Processing
% 31 Jan 2024
% Pranay Borgohain, IIT BBS

% clear workspace
clear all
close all

% To read test image and inputs in a matrix form
input_image  = imread('./assets/tut1-img.jpg');
gray_image   = rgb2gray(input_image);
neg_image    = (ones(size(gray_image), 'uint8') .* 255) - gray_image;

resized_image = imresize(gray_image, [200, 300]);
rotated_image = imrotate(gray_image, 45);

% Display the image and its RGB components
figure; 
subplot(3, 2, 1); imshow(input_image); title("Original");
subplot(3, 2, 2); imshow(input_image(:,:,1)); title("R"); 
subplot(3, 2, 3); imshow(input_image(:,:,2)); title("G");
subplot(3, 2, 4); imshow(input_image(:,:,3)); title("B");
subplot(3, 2, 5); imshow(gray_image); title("Grayscale");
subplot(3, 2, 6); imshow(neg_image); title("Negative");

figure;
subplot(1, 2, 1); imshow(resized_image); title("Resized");
subplot(1, 2, 2); imshow(rotated_image); title("Rotated");

bit_planes = split_bits(gray_image);

function bit_plane = split_bits(image)
    bit_plane = zeros(size(image, 1), size(image, 2), 8);
    figure;
    for i = 1:8
        mask = 2^(i-1);
        bit_plane(:,:,i) = bitand(mask, image(:,:,1));
        subplot(2, 4, i); imshow(bit_plane(:,:,i));
        if i == 1
            title("LSB")
        elseif i == 8
            title("MSB")
        end
    end
end
