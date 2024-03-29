
import("stdfaust.lib");

process = hpf(1000);

hpf(cutoff) = _ :> hpf1(cutoff);

hpf1(cutoff) = LPF1(cutoff) : - : LPF1(cutoff);

LPF1(cutoff) = _ <: LPF1(cutoff);

LPF1(cutoff) = v : LPF1(cutoff) :> _ <: v - cutoff * LPF1(cutoff);
