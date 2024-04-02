import("stdfaust.lib");
import("math.lib");

/*
function clap(tone, attack, decay, gate) {
  // Layered white noise synthesis
  let no = el.noise();

  let e1 = el.adsr(el.add(0.035, attack), el.add(0.06, decay), 0.0, 0.1, gate);
  let e2 = el.adsr(el.add(0.025, attack), el.add(0.05, decay), 0.0, 0.1, gate);
  let e3 = el.adsr(el.add(0.015, attack), el.add(0.04, decay), 0.0, 0.1, gate);
  let e4 = el.adsr(el.add(0.005, attack), el.add(0.02, decay), 0.0, 0.1, gate);

  // Then we run the result through a bandpass filter set according to tone
  // between 400Hz and 3500Hz, and slightly saturate.
  return el.tanh(
    el.bandpass(
      tone,
      1.214,
      el.add(
        el.mul(no, e1),
        el.mul(no, e2),
        el.mul(no, e3),
        el.mul(no, e4),
      ),
    )
  );
}

Inspired from https://www.nickwritesablog.com/drum-synthesis-in-javascript/
*/

clap(tone, attack, delay, gate) = x
with {
    e1 = en.adsr(0.035 + attack, 0.06 + delay, 0.0, 0.1, gate);
    e2 = en.adsr(0.025 + attack, 0.05 + delay, 0.0, 0.1, gate);
    e3 = en.adsr(0.015 + attack, 0.04 + delay, 0.0, 0.1, gate);
    e4 = en.adsr(0.005 + attack, 0.02 + delay, 0.0, 0.1, gate);


    x = ma.tanh((e1 + e2 + e3 + e4) * no.noise : fi.resonbp(tone, 1.214, 1));
    };

process = clap(800, 0.005, 0.204, button("gate"));
