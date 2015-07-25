%% gen_sample_sig: Generate sample signal.
function sig = gen_sample_sig(f, f_sample, duration)
    period = floor(f_sample / f);
    t = [1 : f_sample * duration]';
    sig = double(mod(t, period) == 0);
