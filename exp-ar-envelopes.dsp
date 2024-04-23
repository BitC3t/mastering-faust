import("stdfaust.lib");
/*
function renderSynthVoice(voiceState) {
  // Each synth voice has a gate signal like this that simply
  // alternates between 0 and 1 according to our state, `voiceState`.
  let gate = el.const({key: `${voiceState.key}:gate`, value: voiceState.gate});
 
  // We then use a smoothing filter to derive our Attack/Release envelope. We also
  // install the meter here to monitor the gate signal for our plot.
  let env = el.smooth(el.tau2pole(0.2), gate);
 
  // Multiply our envelope in to modulate the amplitude of the detuned
  // sawtooth pair, along with a static gain factor.
  return el.mul(
    0.2,
    env,
    el.add(
      el.blepsaw(el.const({key: `${voiceState.key}:freq:1`, value: voiceState.freq}))),
      el.blepsaw(el.const({key: `${voiceState.key}:freq:2`, value: voiceState.freq * 1.01}))),
    )
  );
}
*/

// Inspired from https://www.elementary.audio/docs/tutorials/envelope-generators

gain = hslider("Gain", 0.1, 0.0, 1.0, 0.1);

env = button("gate") : si.smooth(ba.tau2pole(0.2));

process = (0.2 * env * (os.polyblep_saw(440) + os.polyblep_saw(440 * gain)));