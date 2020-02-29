rng(707);

snr_limits = [5, 40];
sir_limits = -5;
slope_limits = [0, 1.5];
nr_samples = 50;

sb0_mat = zeros(1, 1024);
sb_mat = zeros(1, 1024);
Sb0_mat = zeros(1, 2048);
Sb_mat = zeros(1, 2048);
S_mat = zeros(1, 2048, 154);
rgb_spect_mat = zeros(1, 2048, 154, 3);
label_mat = zeros(1, 2048);

index = 1;
for i=1:1:nr_samples
    for snr = snr_limits(1):5:snr_limits(2)
        for sir = sir_limits:5:snr+5
            for interfer_coef = slope_limits(1):0.1:slope_limits(2)

                    nr_targets = randi([1,4], 1);
                    A = randi([1,100],1, nr_targets) / 100;
                    A(randi([1,nr_targets])) = 1;
                    teta = unifrnd(-pi,pi, 1, nr_targets);
                    complexA = A.*exp(1i*teta);
                    r = randi([2,95], 1, nr_targets);

                    [sb0, sb, Sb0, Sb, S, rgb_spect, label] = gen_signal(snr, sir, interfer_coef, complexA, r);

                    sb0_mat(index, :) = sb0;
                    sb_mat(index, :) = sb;
                    label_mat(index, :) = label;


%                     Sb0_mat(index, :) = Sb0;
%                     Sb_mat(index, :) = Sb;
% 
%                     S_mat(index, :,:) = S;
%                     rgb_spect_mat(index,:,:,:) = rgb_spect;
                    index = index + 1;
            end
         end
    end
%     save_path_idx = strcat('radar_dataset_', int2str(i), '.mat');
%     save(save_path_idx, 'sb0_mat' , 'sb_mat' , 'S_mat' , '-v7.3');
end

save('arim.mat', 'sb0_mat' , 'sb_mat', 'label_mat');



