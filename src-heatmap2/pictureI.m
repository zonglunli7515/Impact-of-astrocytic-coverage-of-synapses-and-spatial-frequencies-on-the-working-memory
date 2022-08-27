Iapp_v = model.Iapp_v_full(:,:,21000);
Iapp_v = single(Iapp_v);
Iapp_v1 = min(Iapp_v,[],'all');
Iapp_v = (Iapp_v - Iapp_v1);
Iapp_v1 = max(Iapp_v,[],'all');
Iapp_v = Iapp_v ./ Iapp_v1 .* 255;
Iapp_v = uint8(Iapp_v);

imagesc(Iapp_v); colormap jet; colorbar; 