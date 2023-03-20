~randSize = 50000;
SynthDef(\grain_synth, {
	|
	sample1,
    sample2,
	gain1 = 0.5,
    gain2 = 0.5,
	pitch1 = 0,
	pitch2 = 0,
	volume = 1,
	pitch = 0,
	pan = 0,
	out,
	maxGrains = 512,
	grainenv = -1,
	grainfreq = 80,
	graindur = 0.020,
	grainrand = 0
	|
	        var pitch_ratio = midiratio(pitch);
	        var ratio1 = midiratio(pitch1);
	        var ratio2 = midiratio(pitch2);
			// TODO start control? Stereo grains?
		    // randomize Phasor to change start position ?
			Out.ar(out,
		Limiter.ar(
			in:
			PitchShift.ar(
				in: volume*GrainIn.ar(2,
					Impulse.kr(freq: grainfreq),
					dur: graindur,
					in: PitchShift.ar(
						in: gain1*(0.5/(grainfreq+200*graindur))*BufRd.ar(1, sample1,
							Phasor.ar(0, BufRateScale.ir(sample1)+grainrand*LFNoise1.kr(1000).range(0,1),
								0, BufFrames.ir(sample1),0)),
						windowSize: 1,
						pitchRatio: ratio1 )
					+
					PitchShift.ar(
						in: gain2*(0.5/(grainfreq+200*graindur))*BufRd.ar(1, sample2,
							Phasor.ar(0, BufRateScale.ir(sample2)+grainrand*LFNoise1.kr(1000).range(0,1),
								0, BufFrames.ir(sample2),0),),
						windowSize: 1,
						pitchRatio: ratio2),
					maxGrains: maxGrains,
					pan: 0,
					envbufnum: grainenv),// *env),
				windowSize: 0.2,
				pitchRatio: pitch_ratio
			),
			level=4/5;
		)
		}).add;
/*

c = {
	arg project_dir = "/Users/guglielmofratticioli/Documents/POLIMI/CMLS/Granulider/",
	winenv = Env([0,1,0], [0.5,0.5], [8, -8]);
	{
		z = Buffer.sendCollection(s, winenv.discretize, 1);
		~sampleBuffer = Buffer.read(s,project_dir +/+ 'res/samples/Chord Drop.wav');
		//~sampleBuffer.plot;
		x = Synth(\in_grain_test, [\envbuf, -1])
	}

}


x = Synth(\in_grain_test, [\envbuf, -1])

//env = EnvGen.kr(Env([0, 1, 0], [1, 1], \sin, 1),
				//gate,
				//levelScale: amp,
				//doneAction: Done.freeSelf);

// use built-in env
//x = Synth(\in_grain_test, [\envbuf, -1])

// switch to the custom env
//x.set(\envbuf, z)

//x.set(\envbuf, -1);

//x.set(\gate, 0);

//b = Buffer.alloc(s,SampleRate)
*/