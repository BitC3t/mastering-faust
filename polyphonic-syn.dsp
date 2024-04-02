import("stdfaust.lib");

f = hslider("Frequency", 440, 100, 1000, 1);
gain = hslider("Gain", 0, 0, 1, 0.1);
gate = button("Gate");

timbre(f) = os.sawtooth(f)*0.5 + sum(i, 5, os.osc(f*(i+1))*(0.5^(i+2)));
process = gain * gate :> en.adsr(0.1,0.1,0.9,0.1) : *(timbre(f)) <: _,_;
effect = dm.zita_light;