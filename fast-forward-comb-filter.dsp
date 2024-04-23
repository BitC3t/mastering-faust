import("stdfaust.lib");

fast_forward_comb(delay, M, gain0, gainM) = _ <: 
*(gain0), gainM * de.delay(delay, M) : +;

process = _ : fast_forward_comb(1, 1, 0.5, 0.8) : _;