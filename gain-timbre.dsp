import("stdfaust.lib")
freq = hslider("freq", 440, 20, 20000, 0.01)
gain = hslider("gain", 0.5, 0, 1, 0.01)
timbre(f) = os.osc(f) * gain + os.osc(f*1.5) * gain + os.osc(f*2) * gain
process = timbre(freq);