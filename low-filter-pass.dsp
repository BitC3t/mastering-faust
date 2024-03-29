import("stdfaust.lib");

lpf1(cutoff, x) =  vslider("Cutoff", cutoff, 20, 20000, 1) * (x - vslider("Resonance", 0, 0, 1, 0.01) * x - vslider("Resonance", 0, 0, 1, 0.01): _);

process = lpf1(1000, os.osc(440));
