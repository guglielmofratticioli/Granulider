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
	pan = 0, //non è dentro l'interfaccia
	out,    //output del sistema
	maxGrains = 512,  //numero suoni (grani) max in contemporanea
	grainenv = -1,    //forma envelope  triangolo
	grainfreq = 80,   //ogni quanto vengono presi i grani dal file somma dei due file audio
	graindur = 0.020, // durata grani
	grainrand = 0     // in teoria dovrebbe randomizzare la selezione dei grani, vorremmo ottenerlo non in successione temporale, in percentuale

	|
	        var pitch_ratio = midiratio(pitch);  // fa in automatico la suddivisone frequenze da semitoni a hz
	        var ratio1 = midiratio(pitch1);      //di quanto shiftare la frequenza del segnale singolo
	        var ratio2 = midiratio(pitch2);
			// TODO start control? Stereo grains?
		    // randomize Phasor to change start position ?
			Out.ar(bus: out,
		         channelsArray:          // in input nel bus metto il channel Limiter come uscita audio
		            Limiter.ar(          //limita il volume tot in % in base se supera i $/5 del limite (level 4/5)
		         	in: PitchShift.ar(  // per entrambi i suoni, che vengono sommati
				in: GrainIn.ar(2,   // 2 canali (stereo)
		         			Impulse.kr(freq: grainfreq),  //   segnale di clock per il granulizer
		         			dur: graindur,                // durata di ogni grain
		         			in: PitchShift.ar(            // SAMPLE 1
		         				in: BufRd.ar(2, sample1,  // BufRd trasforma vettore di numeri in audio
		         					    Phasor.ar(0, BufRateScale.ir(sample1),
				         				0, BufFrames.ir(sample1),
								0)),
						         windowSize: 1,
						         pitchRatio: ratio1 )
					             +
					             PitchShift.ar(            // SAMPLE 2
								         0,
								         BufFrames.ir(sample2) ,
						maxGrains: maxGrains,
		         			pan: 0,
				         	envbufnum: grainenv)*volume,  //
         				windowSize: 1,
		         		pitchRatio: pitch_ratio),
			       level: 4/5;)
	))
}).add;
/*						         in: BufRd.ar(2, sample2,  //
							             Phasor.ar(0, BufRateScale.ir(sample2),
			0)),
						         windowSize: 1,
						         pitchRatio: ratio2),

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