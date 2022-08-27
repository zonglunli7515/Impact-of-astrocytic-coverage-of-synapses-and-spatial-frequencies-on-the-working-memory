V = model.V_line(:,21000);
V_v = reshape(V, 78, 78);
V_v1 = min(V_v,[],'all');
V_v = (V_v - V_v1);
V_v1 = max(V_v,[],'all');
V_v = V_v ./ V_v1 .* 255;
V_v = uint8(V_v);

imagesc(V_v); colormap jet; colorbar;