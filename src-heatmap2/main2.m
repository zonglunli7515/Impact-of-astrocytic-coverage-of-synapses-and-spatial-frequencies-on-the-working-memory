tic;
% rng(43); %42

test_variance_list = 0:0.02:0.2; % 0:0.02:0.2
filter_thr_list = 4:2:58; % 4:2:58
memory_list = zeros(length(test_variance_list), length(filter_thr_list));
parfor i=1:length(test_variance_list)
    rng(42);
    this = zeros(1,length(filter_thr_list));
    for j=1:length(filter_thr_list)
        variance = test_variance_list(i);
        filter_thr = filter_thr_list(j);
        params = model_parameters(variance);
        model = init_model();
        [model] = simulate_model(model, params, filter_thr);
        [memory_performance] = ...
        compute_memory_performance(model.images, model.V_line, model.T_Iapp);
        this(j) = memory_performance.learned_pattern_similarities;
    end
    memory_list(i,:)=this;
end

figure;
imagesc(filter_thr_list,test_variance_list,memory_list); colormap jet; colorbar; xlabel('filter threshold');ylabel('test noise');
xticks([4 10 16 22 28 34 40 46 52 58]);
% saveas(gcf,'../results/heatmap_8_02.png');
save('../results/astrotwo6.mat','memory_list');
toc;