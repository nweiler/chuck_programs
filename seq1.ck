[220, 330, 330, 440, 790, 330, 440, 330] @=> int seq[];

TriOsc o1 => ADSR env1 => LPF f1 => Echo e1 => dac;
TriOsc o2 => ADSR env2 => LPF f2 => Echo e2 => dac;
Shakers imp => BiQuad f3 => dac;

env1.set(15::ms, 30::ms, .5, 75::ms);
env2.set(15::ms, 30::ms, .5, 75::ms);

1.0 => f1.Q;
1.0 => f2.Q;

.99 => f3.prad;
1 => f3.eqzs;


0 => int i;


222::ms => e1.delay;
1000::ms => e1.max;
.1 => e1.mix;

222::ms => e2.delay;
1000::ms => e2.max;
.1 => e2.mix;

Math.random2(600, 1200) => f1.freq;
Math.random2(600, 1200) => f2.freq;


// main loop
while(true){

  Math.random2(400, 1200) => f1.freq;
  env1.keyOn();
  100::ms => now;
  
  env1.keyOff();
  100::ms => now;
 
  Math.random2(400, 1200) => f2.freq;
  env2.keyOn();
  100::ms => now;
  
  env2.keyOff();
  100::ms => now;  

  1 => imp.which;
  1.0 => imp.noteOn;
  100::ms => now;
  
  2 => imp.which;
  Math.random2(400, 1200) => f3.pfreq;
  1.0 => imp.noteOn;
  100::ms => now;
  
  i++;
  8 %=> i;
  seq[i] => o1.freq;
  seq[i] / 3=> o2.freq;
}