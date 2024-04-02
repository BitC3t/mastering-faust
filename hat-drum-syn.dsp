import("stdfaust.lib");
import("math.lib");

/*
function cycle(freq, phaseOffset) {
  let t = el.add(el.phasor(freq), phaseOffset);
  let p = el.sub(t, el.floor(t));

  return el.sin(el.mul(2 * Math.PI, p));
}

function hat(pitch, tone, attack, decay, gate) {
  // Synthesis
  let m2 = el.noise();
  let m1 = cycle(el.mul(2, pitch), el.mul(2, m2));
  let m0 = cycle(pitch, el.mul(2, m1));

  // Then we run the result through a bandpass filter set according to tone
  // between 800Hz and 18kHz.
  let f = el.bandpass(tone, 1.214, m0);

  // Finally we have the amp envelope with an attack in [5ms, 200ms] and a
  // decay in [5ms, 4000ms]
  let env = el.adsr(attack, decay, 0.0, 0.1, gate);

  return el.mul(f, env);
}

Inspired by https://www.nickwritesablog.com/drum-synthesis-in-javascript/
*/

cycle(freq, phaseOffset) = z
with {
  t = os.phasor(1.0, freq) + phaseOffset;
  p = t - floor(t);

  z = sin(2*ma.PI*p);
};

hat(pitch, tone, attack, decay, gate) = x 
with {
  m2 = no.noise;
  m1 = cycle(2*pitch, 2*m2);
  m0 = cycle(pitch, 2*m1);

  f = m0 : fi.resonbp(tone, 1.214, 1);
  env = en.adsr(attack, decay, 0.0, 0.1, gate);
  x = f * env;
  };

process = hat(317, 12000, 0.005, 0.1, button("gate")) : _;