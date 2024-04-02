import("stdfaust.lib");
import("math.lib");

/*
function kick(pitch, click, attack, decay, drive, gate) {
  // First up we have our amp envelope
  let env = el.adsr(attack, decay, 0.0, 0.1, gate);

  // Then we have a pitch envelope with 0 attack and decay in [5ms, 4s].
  // The `el.adsr` node uses exponential segments which is great for our purposes
  // here, but you could also weight the curve more or less aggressively by squaring
  // or taking the square root of the pitchenv signal.
  let pitchenv = el.adsr(0.005, click, 0.0, 0.1, gate);

  // Then our synthesis: a sine tone at our base pitch, whose frequency is quickly
  // modulated by the pitchenv to sweep from 5*pitch to 1*pitch over `click` seconds.
  // The resulting sound is multiplied straight through our amp envelope.
  let clean = el.mul(
    env,
    el.cycle(
      el.mul(
        // The pitch envelope runs from a multiplier of 5 to
        // a multiplier of 1 on the original pitch
        el.add(1, el.mul(4, pitchenv)),
        pitch,
      )
    )
  );

  // Then you can drive it into a soft clipper with a gain multiplier in [1, 10]
  return el.tanh(el.mul(clean, drive));
}

Inspired by https://www.nickwritesablog.com/drum-synthesis-in-javascript/
*/

kick(pitch, click, attack, decay, drive, gate) = x 
with {
  env = en.adsr(attack, decay, 0.0, 0.1, gate);
  pitchenv = en.adsr(0.005, click, 0.0, 0.1, gate);
  clean = *(*(env, os.osc(1 + 4*pitchenv)), pitch);

  x = ma.tanh(*(clean, drive));
};

process = kick(40, 0.104, 0.005, 0.4, 4, button("gate"));
