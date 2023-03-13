s.boot;

(
var winenv;
// a custom envelope
winenv = Env([0, 1, 0], [0.5, 0.5], [8, -8]);
z = Buffer.sendCollection(s, winenv.discretize, 1);

~pinkNoiseBuffer = Buffer.alloc(s,44100)
BufUtils.filledBuf(~pinkNoiseBuffer, PinkNoise.ar(44100), s);

SynthDef(\in_grain_test, { |out, gate = 1, amp = 1, envbuf|
    var pan, env;
    // use mouse x to control panning
    pan = MouseX.kr(-1, 1);
    env = EnvGen.kr(
        Env([0, 1, 0], [1, 1], \sin, 1),
        gate,
        levelScale: amp,
        doneAction: Done.freeSelf);
    Out.ar(out,
        //GrainIn.ar(2, Impulse.kr(32), 1, PinkNoise.ar * 0.05, pan, envbuf) * env)
		GrainIn.ar(2, Impulse.kr(32), 1, BufRd.ar(1, ~pinkNoiseBuffer, Phasor.ar(0, BufRateScale.ir(~pinkNoiseBuffer), 0, BufFrames.ir(~pinkNoiseBuffer))), pan, envbuf) * env)

}).add;

)

// use built-in env
x = Synth(\in_grain_test, [\envbuf, -1])

// switch to the custom env
x.set(\envbuf, z)

x.set(\envbuf, -1);

x.set(\gate, 0);

b = Buffer.alloc(s,SampleRate)