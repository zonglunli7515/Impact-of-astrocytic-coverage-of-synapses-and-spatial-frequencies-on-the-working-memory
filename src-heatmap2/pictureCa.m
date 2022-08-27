Ca_v = model.Ca_size_neuros(:,:,20000);
Ca1 = min(Ca_v,[],'all');
Ca_v = (Ca_v - Ca1);
Ca1 = max(Ca_v,[],'all');
Ca_v = Ca_v ./ Ca1.* 255;
Ca_v = uint8(Ca_v);

imagesc(Ca_v); colormap jet; colorbar; 