import("stdfaust.lib");
gain0 = hslider("Gain 1 (440hz)", 0, 0, 1, 0.1);
gain2 = hslider("Gain 2 (880hz)", 0, 0, 1, 0.1);
process = os.osc(440)*gain0, os.osc(880)*gain2 
    :> _ <: dm.zita_rev1;