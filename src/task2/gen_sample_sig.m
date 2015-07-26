%% gen_sample_sig: Generate sample signal.
function sig = gen_sample_sig(f_sample, duration, t_total)
    pos = 1;
    part_len = floor(f_sample * duration);
    sig_len = floor(f_sample * t_total);
    sig = zeros(sig_len, 1);

    while pos <= sig_len
        sig(pos) = 1;
        m = ceil(pos / part_len) - 1;  % Assume start from part 0.
        pos = pos + 80 + 5 * mod(m, 50);
    end
