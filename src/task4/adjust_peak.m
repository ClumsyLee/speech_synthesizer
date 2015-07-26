%% adjust_peak: Adjust the peak of a system
function [adjusted] = adjust_peak(A, f_sample, f_delta)
    poles = roots(A);
    upside =   (imag(poles) > 0);
    downside = (imag(poles) < 0);

    theta = f_delta / f_sample * 2 * pi;
    poles(upside)   = poles(upside)   * (cos(theta) + i * sin(theta));
    poles(downside) = poles(downside) * (cos(theta) - i * sin(theta));

    adjusted = poly(poles);
