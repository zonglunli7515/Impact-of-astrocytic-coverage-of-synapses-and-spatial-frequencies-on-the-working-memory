filter_thr = 5:5:60;
memory_performance = [0.9119  0.9157  0.9086   0.9003    0.8638    0.8372    0.8124   0.8062   0.8008   0.7970  0.8712  0.9111];
digit_accuracy = [0.9916  0.9606   0.9597  0.9270   0.8591   0.8389  0.7609   0.7458   0.7852   0.7852   0.8574  0.9178];
background_accuracy = [0.8322  0.8709   0.8574   0.8736    0.8685  0.8354  0.8639   0.8665   0.8164   0.8087  0.8849  0.9043];

figure;
axes('NextPlot','add');
plot(filter_thr, memory_performance, 'DisplayName', 'overall accuracy', 'LineWidth', 1);
plot(filter_thr, digit_accuracy, '--', 'DisplayName', 'digit accuracy', 'LineWidth', 1);
plot(filter_thr, background_accuracy, ':', 'DisplayName', 'background accuracy', 'LineWidth', 1);
xlabel('Filter threshold');
ylabel('Accuracy');
legend('show','Location','southwest');
