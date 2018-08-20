
% name of the input file
imname = '01112v.jpg';

% read in the image
fullim = imread(imname);

% convert to double matrix (might want to do this later on to same memory)
fullim = im2double(fullim);

% compute the height of each part (just 1/3 of total)
height = floor(size(fullim,1)/3);

% separate color channels
B = fullim(1:height,:);
G = fullim(height+1:height*2,:);
R = fullim(height*2+1:height*3,:);

% Align the images
crop_size = [30 10 300 300];
R_sub = imcrop(R,crop_size);
G_sub = imcrop(G,crop_size);
B_sub = imcrop(B,crop_size);
%imshow(R_sub);
G_final = find_displace(R_sub,G_sub);
B_final = find_displace(R_sub,B_sub);
G_final = circshift(G, G_final);
B_final = circshift(B, B_final);
RGB_final = cat(3,R , G_final, B_final);
figure();
imshow(RGB_final);


% save result image
imwrite(RGB_final,['result-' imname]);