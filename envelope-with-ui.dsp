import("stdfaust.lib");

envelope = hgroup("Envelope", en.adsr(attack,decay,sustain,release,gate) * gain)
with{
    attack = hslider("Attack", 0.5, 0, 1, 0.1);
    decay = hslider("Decay", 0.5, 0, 1, 0.1);
    sustain = hslider("Sustain", 0.8, 0.5, 1, 0.01); // this needs more time cause yk its sustain
    release = hslider("Release", 0.5, 0, 1, 0.1);
    gate = button("Gate");
    gain = hslider("Gain", 0, 0, 1, 0.1);
};

// define your process for the envelope
process = envelope :> *(os.osc(440));