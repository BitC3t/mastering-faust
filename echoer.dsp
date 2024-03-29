import("stdfaust.lib")
echo(d, f) = + ~ (@(d) : *(f));
process = button("play") : pm.djembe(60, 0.1, 0.2, 1) : echo(44100/4, 0.5);