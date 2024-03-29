import("stdfaust.lib");
process = _, (hslider("gain", 0, 0, 100, 1), 100 : /) : *;