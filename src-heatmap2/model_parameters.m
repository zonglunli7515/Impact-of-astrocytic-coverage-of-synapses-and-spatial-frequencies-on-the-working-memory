function [params] = model_parameters(variance_test)
persistent params_p
if nargin < 1
    params = params_p;
    return;
end
params = struct;

%% Timeline
params.t_end = 2.3; % normal: 2.3, short: 1.8, long: 2.8
params.step = 0.0001;
params.n = fix(params.t_end / params.step);

%% Experiment
params.learn_start_time = 0.1; % 0.1
params.learn_impulse_duration = 0.2;
params.learn_impulse_shift = 0.3;
params.learn_order = 3;

params.test_start_time = 2;  % normal: 2, short:1.5， long:2.5
params.test_impulse_duration = 0.15;
params.test_impulse_shift = 0.4;
params.test_order = 3;

%% Applied pattern current 
params.variance_learn = 0;
params.variance_test = variance_test;
params.Iapp_learn = 80;
params.Iapp_test = 8; % 8

%% Movie
params.after_sample_frames = 200;
params.before_sample_frames = 1;

%% Poisson noise
params.poisson_nu = 1.5;
params.poisson_n_impulses = 15;
params.poisson_impulse_duration = fix(0.03 / params.step);
params.poisson_impulse_initphase = fix(1.5 / params.step);
params.poisson_amplitude = 0; % 10

%% Runge-Kutta steps
params.u2 = params.step / 2;
params.u6 = params.step / 6;

%% Network size
params.mneuro = 81;  %79
params.nneuro = 81;
params.quantity_neurons = params.mneuro * params.nneuro;
params.mastro = 16;  %13
params.nastro = 16;
az = 6; % Astrosyte zone size 
params.az = az - 1;

%% Initial conditions
params.v_0 = -70;
params.ca_0 = 0.072495;
params.h_0 = 0.886314;
params.ip3_0 = 0.820204;

%% Neuron mode
params.aa = 0.1; %FS
params.b = 0.2;
params.c = -65;
params.d = 2;
params.alf = 10;
params.k = 600;
params.neuron_fired_thr = 30;
params.I_input_thr = 25;

%% Synaptic connections
params.N_connections = 40; % maximum number of connections between neurons
params.quantity_connections = params.quantity_neurons * params.N_connections;
params.lambda = 5; % average exponential distribution
params.beta = 5;
params.gsyn = 0.025;
params.aep = 0.5; % astrocyte effect parameter
params.Esyn = 0;
params.ksyn = 0.2;

%% Astrosyte model
params.dCa = 0.05;
params.dIP3 = 0.1; % 0.05
params.enter_astro = 6;
params.min_neurons_activity = az*az*0.5;     % this corresponds to N_a * F_act in the paper, F_act = 0.5
params.t_neuro = 0.06;
params.amplitude_neuro = 5;
params.threshold_Ca = 0.15;
window_astro_watch = 0.01; % t(sec)
shift_window_astro_watch = 0.001; % t(sec)
impact_astro = 0.25; % t(sec)
params.impact_astro = fix(impact_astro / params.step);
params.window_astro_watch = fix(window_astro_watch / params.step);
params.shift_window_astro_watch = fix(shift_window_astro_watch / params.step);

%% Memory performance
params.max_spikes_thr = 30;

%% 
params_p = params;
end