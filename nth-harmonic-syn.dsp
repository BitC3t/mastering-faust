import("stdfaust.lib");
funfreq = hslider("Fundamental Freq", 440, 100, 1000, 1);
num_harmonics = 10;
gain = hslider("Gain", 0, 0, 1, 0.1);

series = par(i, num_harmonics, os.osc(funfreq*(i + 1)) * gain);
process = series :> _ <: dm.zita_rev1;