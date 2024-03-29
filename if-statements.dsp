import("stdfaust.lib");
gain = hslider("gain", 0, 0, 1, 0.1);
process = button("yes/no") : select2(os.osc(440), os.osc(0));