function [fft_lp_out] = fft_lp_fil(fft_lp_in, thres)
img_f = fft2(fft_lp_in);
img_fc = fftshift(img_f);
[rows, cols] = size(fft_lp_in);
for x=1:rows
    for y=1:cols
        if distance([x y], [floor(rows/2) floor(cols/2)]) > thres
            img_fc(x,y) = 0+0i;
        end
    end
end
img_fdc = ifftshift(img_fc);
fft_lp_out = ifft2(img_fdc);
fft_lp_out = abs(fft_lp_out);
fft_lp_out = (fft_lp_out - min(fft_lp_out,[],'all')) / (max(fft_lp_out,[],'all') - min(fft_lp_out,[],'all'));
end

function [f_dist] = distance(p1, p2)
f_dist = sqrt((p1(1)-p2(1))^2 + (p1(2)-p2(2))^2);
end