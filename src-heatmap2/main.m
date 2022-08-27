tic;
%% Initialization
close all; clearvars;
    
rng(42);
    
params = model_parameters(0.2);
model = init_model();
    
%% Simulation
[model] = simulate_model(model, params, 10);

%% raster
% [row,col]=find(model.V_line>=30);
% scatter(params.step*col,row, 1, 'filled');

%% glutamate of neuron 1600
%plot(params.step*(1:params.n),model.G(1600,:))

toc;

% [model.video] = make_video(model.Ca_size_neuros, ...
%         model.V_line, ...
%         model.Iapp_v_full, ...
%         model.T_record_met);
%     
% show_video(model.video, struct('limits', [0, 255], 'fps', 100));

% Compute memory performance
% [memory_performance] = ...
%      compute_memory_performance(model.images, model.V_line, model.T_Iapp);
%     
% fprintf('Mean memory performance: %0.4f\n', memory_performance.mean_performance);
% fmt = repmat(' %0.4f',1,numel(memory_performance.learned_pattern_similarities));
% fprintf(['Memory performance per image: ', fmt, '\n'], ...
% memory_performance.learned_pattern_similarities);