import("stdfaust.lib");
gain(f) = vslider("gain %f", 0, 0, 1, 0.1);
// process = no.noise : hgroup("Equalizer", seq(i, 5, gain(i)));