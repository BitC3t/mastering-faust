import("stdfaust.lib");

gain = hslider("Gain", 0, 0, 1, 0.1);
trembolo = hgroup("Trembolo", (os.osc(freq)*depth))
with {
    freq = hslider("Frequency", 440, 100, 1000, 1);
    depth = hslider("Depth", 0, 0, 1, 0.1);
};

process = +(gain, trembolo);