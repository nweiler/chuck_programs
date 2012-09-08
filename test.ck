SinOsc o => ADSR env => dac;
env.set(10::ms, 20::ms, .5, 100::ms);
440 => o.freq;
1.0 => o.gain;

while(true) {

  Math.random2(440, 660) => o.freq;
  env.keyOn();
  100::ms => now;

  env.keyOff();
  100::ms => now;
}
  