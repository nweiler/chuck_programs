Shakers s => BPF f => dac;
800 => f.freq;

Impulse i => f => Echo e => dac;
75::ms => e.delay;
75::ms => e.max;
.4 => e.mix;

SinOsc o => Gain g;
440 => o.freq;
.1 => g.gain;
2 => f.Q;

while(true) {

  Math.random2(800, 4000) => f.freq;
  
  Math.random2(440, 660) => o.freq;
  1.0 => s.noteOn;
  .1 => g.gain;
  1.0 => i.next;
  100::ms => now;

  1.0 => s.noteOff;
  0.0 => g.gain;
  0.0 => i.next;
  100::ms => now;
  
  s.which() + 1 => s.which;
}