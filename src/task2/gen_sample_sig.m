%% gen_sample_sig: Generate sample signal.
function sig = gen_sample_sig(f, f_sample, duration)
    sig = [];
    offset = 0;
    for k = 1:length(f)   % For every part.
        period = floor(f_sample / f(k));
        len = floor(f_sample * duration(k));
        if len <= offset  % Skip this part.
            sig = [sig; zeros(len, 1)];
            offset = offset - len;
        else
            len = len - offset;
            % Skip first `offset` elements.
            t = [zeros(1, offset), 1:len]';
            sig = [sig; double(mod(t, period) == 1)];
            offset = mod(period - mod(len, period), period);
        end
    end
