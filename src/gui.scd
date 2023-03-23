

// Hex colors :
var lightsky = Color.fromHexString("#7ca3d2");
//var sky = Color.fromHexString("#56729a");
var blue = Color.fromHexString("#274d83");
var navy = Color.fromHexString("#14305f");
var sky = Color.fromHexString("#f7efd6");
var white = Color.fromHexString("#ffffff");
var black = Color.fromHexString("#000000");

~sample1 = ~supermarket;
~sample2 = ~bikeGears;
~reset = {
	~granSynth = Synth.new(\grain_synth, [
			\sample1,~sample1,
			\sample2,~sample2,
			\volume,~numVolume.value(),
			\delta_pitch,~numPitch.value(),
			\gain1,~numVol1.value(),
			\pitch1,~numPitch1.value(),
			\gain2,~numVol2.value(),
			\pitch2,~numPitch2.value(),
			\grainfreq, ~numFrequency.value(),
			\graindur,~numDuration.value(),
			\grainrand, ~numRandomize.value()/100

	]);
};

~w = Window.new("Granullider", Rect(500,500,1000,700)).background_(sky);

// final
~start = Button.new(~w, Rect(290,30,80,30))
.states_([["Start",navy,white],["Stop",navy,sky]])
.background_(navy)
.action_({
	if ( ~start.value == 0 ,
		{ postln("Stopped"); ~granSynth.free; ~reset; }
		,{ postln("Started"); ~reset.play });
});

~slid1 = Slider.new(~w,Rect(390,30,120,30))
.value_(1)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numVolume.value_(obj.value.linlin(0.00,1.00,0.00,1.00));
	~granSynth.set(\volume , obj.value);
});
StaticText.new(~slid1, Rect(10,0,80,30)).string_("Volume").stringColor_(navy);

~slid2 = Slider.new(~w,Rect(560,30,120,30))
.value_(0.5)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numPitch.value_(obj.value.linlin(0,1,-12,12));
	~granSynth.set(\pitch , obj.value);
});
StaticText.new(~slid2, Rect(10,0,80,30)).string_("Pitch").stringColor_(navy);

// sound1
~but1 = Button.new(~w, Rect(65,90,110,30)).states_([
		["Bike Gears",navy,white],
		["Bloopy Nooper",navy,white],
		["Broken Pottery",navy,white],
		["Chord Drop",navy,white],
		["Geiger Kalimba",navy,white],
		["Harsh Feedback",navy,white],
		["Harsh Gesture",navy,white],
		["Hull Breach",navy,white],
		["lofi Cut",navy,white],
		["low Formant",navy,white],
		["Octaved Voices",navy,white],
		["Pebble Rain",navy,white],
		["Supermarket",navy,white],
	]).background_(navy)
.value_(12)
.action_({
	if( ~but1.value == 0 , { ~sample1=~bikegears;});
	if( ~but1.value == 1 , { ~sample1=~bloodyNooper;});
	if( ~but1.value == 2 , { ~sample1=~brokenPottery;});
	if( ~but1.value == 3 , { ~sample1=~chordDrop;});
	if( ~but1.value == 4 , { ~sample1=~geigerKalimba; });
	if( ~but1.value == 5 , { ~sample1=~harshFeedback; });
	if( ~but1.value == 6 , { ~sample1=~harshGesture; });
	if( ~but1.value == 7 , { ~sample1=~hullBreach; });
	if( ~but1.value == 8 , { ~sample1=~lofiCut;});
	if( ~but1.value == 9 , { ~sample1=~lowFormant;});
	if( ~but1.value == 10 , { ~sample1=~octavedVoices;});
	if( ~but1.value == 11 , { ~sample1=~pebbleRain;});
	if( ~but1.value == 12 , { ~sample1=~supermarket;});
	~granSynth.set(\sample1,~sample1);
	postln(~sample1);
});

~slid3 = Slider.new(~w, Rect(190,90,100,30))
.value_(1)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numVol1.value_(obj.value.linlin(0.00,1.00,0.00,1.00));
	~granSynth.set(\gain1 , obj.value);
});
StaticText.new(~slid3, Rect(10,0,80,30)).string_("Vol.").stringColor_(navy);

~slid4 = Slider.new(~w, Rect(340,90,100,30))
.value_(0.5)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numPitch1.value_(obj.value.linlin(0,1,-12,12));
	~granSynth.set(\pitch1 , obj.value.linlin(0,1,-12,12));
});
StaticText.new(~slid4, Rect(10,0,80,30)).string_("Pitch").stringColor_(navy);

//sound2
~but2 = Button.new(~w, Rect(495,90,120,30)).states_([
		["Bike Gears",navy,white],
		["Bloopy Nooper",navy,white],
		["Broken Pottery",navy,white],
		["Chord Drop",navy,white],
		["Geiger Kalimba",navy,white],
		["Harsh Feedback",navy,white],
		["Harsh Gesture",navy,white],
		["Hull Breach",navy,white],
		["lofi Cut",navy,white],
		["low Formant",navy,white],
		["Octaved Voices",navy,white],
		["Pebble Rain",navy,white],
		["Supermarket",navy,white],
	]).background_(navy)
.value_(0)
.action_({
	if( ~but2.value == 0 , { ~sample2=~bikegears;});
	if( ~but2.value == 1 , { ~sample2=~bloodyNooper;});
	if( ~but2.value == 2 , { ~sample2=~brokenPottery;});
	if( ~but2.value == 3 , { ~sample2=~chordDrop;});
	if( ~but2.value == 4 , { ~sample2=~geigerKalimba; });
	if( ~but2.value == 5 , { ~sample2=~harshFeedback; });
	if( ~but2.value == 6 , { ~sample2=~harshGesture; });
	if( ~but2.value == 7 , { ~sample2=~hullBreach; });
	if( ~but2.value == 8 , { ~sample2=~lofiCut;});
	if( ~but2.value == 9 , { ~sample2=~lowFormant;});
	if( ~but2.value == 10 , { ~sample2=~octavedVoices;});
	if( ~but2.value == 11 , { ~sample2=~pebbleRain;});
	if( ~but2.value == 12 , { ~sample2=~supermarket;});
	~granSynth.set(\sample2,~sample2);
	postln(~sample2);
});

~slid5 = Slider.new(~w, Rect(630,90,100,30))
.value_(1)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numVol2.value_(obj.value.linlin(0.00,1.00,0.00,1.00));
	~granSynth.set(\gain2 , obj.value);
});
StaticText.new(~slid5, Rect(10,0,80,30)).string_("Vol.").stringColor_(navy);

~slid6 = Slider.new(~w, Rect(780,90,100,30))
.value_(0.5)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
		~numPitch2.value_(obj.value.linlin(0,1,-12,12));
	    ~granSynth.set(\pitch2 , obj.value.linlin(0,1,-12,12));
});
StaticText.new(~slid6, Rect(10,0,80,30)).string_("Pitch").stringColor_(navy);

//envelope
StaticText.new(~w,Rect(460,393,80,30)).string_("Envelope").stringColor_(black).font_(Font(["Helvetica-bold"].choose,18));

~slid7 = Slider.new(~w, Rect(100,450,130,30))
.value_(0)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numAttack.value_(obj.value.linlin(0.00,1.00,0,200))
});
StaticText.new(~slid7, Rect(35,0,80,30)).string_("Attack").stringColor_(navy);

~slid8 = Slider.new(~w, Rect(320,450,130,30))
.value_(0)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numDecay.value_(obj.value.linlin(0.00,1.00,0,200))
});
StaticText.new(~slid8, Rect(35,0,80,30)).string_("Decay").stringColor_(navy);

~slid9 = Slider.new(~w, Rect(530,450,130,30))
.value_(1)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numSustain.value_(obj.value.linlin(0.00,1.00,0.00,1.00))
});
StaticText.new(~slid9, Rect(35,0,80,30)).string_("Sustain").stringColor_(navy);

~slid10 = Slider.new(~w, Rect(740,450,130,30))
.value_(0)
.background_(white)
.thumbSize_(2)
.action_({
	arg obj;
	~numRelease.value_(obj.value.linlin(0,1,0,500))
});
StaticText.new(~slid10, Rect(35,0,80,30)).string_("Release").stringColor_(navy);

//knobs
~knob1 = Knob.new(~w, Rect(226.5,520,80,80))
.background_(white)
.color_([white,lightsky,white,lightsky])
.action_({
	arg obj;
	~numFrequency.value_(obj.value.linlin(0,1,0,250));
	~granSynth.set(\grainfreq , obj.value.linlin(0,1,0,250));
});
StaticText.new(~w, Rect(235.5,636,80,20)).string_("Frequency").font_(Font(["Helvetica-bold"].choose, 14));

~knob2 = Knob.new(~w, Rect(459.5,520,80,80))
.background_(lightsky)
.color_([lightsky,lightsky,white,white])
.action_({
	arg obj;
	~numDuration.value_(obj.value.linlin(0.00,1.00,0.00,1));
	~granSynth.set(\graindur , obj.value.linlin(0,1,0,1));
});
StaticText.new(~w, Rect(459.5,636,80,20)).align_(\center).string_("Duration").font_(Font(["Helvetica-bold"].choose, 14));

~knob3 = Knob.new(~w, Rect(692.5,520,80,80))
.background_(navy)
.color_([navy,navy,white,white])
.action_({
	arg obj;
	~numRandomize.value_(obj.value.linlin(0,1,0,100));
	~granSynth.set(\grainrand , obj.value/100);
	~granSynth.run(false);
	~granSynth.run;

});

StaticText.new(~w, Rect(685.5,636,100,20)).align_(\center).string_("Granular drift").font_(Font(["Helvetica-bold"].choose, 14));

//numboxes
~numVolume = NumberBox.new(~w, Rect(509,31,38,28))
.value_(1)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);


~numPitch = NumberBox.new(~w, Rect(679,31,38,28))
.value_(0)
.decimals_(0)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numVol1 = NumberBox.new(~w, Rect(289,91,39,28))
.value_(1)
.decimals_(2)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numPitch1 = NumberBox.new(~w, Rect(439,91,38,28))
.value_(0)
.decimals_(0)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numVol2 = NumberBox.new(~w, Rect(729,91,38,28))
.value_(1)
.decimals_(2)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numPitch2 = NumberBox.new(~w, Rect(879,91,38,28))
.value_(0)
.decimals_(0)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numAttack = NumberBox.new(~w, Rect(229,450,38,28))
.decimals_(0)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numDecay = NumberBox.new(~w, Rect(449,450,38,28))
.decimals_(0)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numSustain = NumberBox.new(~w, Rect(659,450,38,28))
.decimals_(0)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numRelease = NumberBox.new(~w, Rect(869,450,38,28))
.decimals_(0)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numFrequency = NumberBox.new(~w, Rect(251.5,605,38,28))
.value_(1)
.decimals_(0)
.background_(white)
.normalColor_(lightsky)
.align_(\center)
.scroll_step_(0);

~numDuration = NumberBox.new(~w, Rect(485,605,44,28))
.value_(0.25)
.decimals_(3)
.background_(lightsky)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

~numRandomize = NumberBox.new(~w, Rect(720,605,38,28))
.value_(0)
.decimals_(0)
.background_(navy)
.normalColor_(white)
.align_(\center)
.scroll_step_(0);

//stethscope
~scope1 = ScopeView.new(~w, Rect(75, 160, 393, 200)).background_(lightsky);  //non sono sicura su questo, bisogna aggiungere anche ScopeOut2
~scope2 = ScopeView.new(~w, Rect(515, 160, 393, 200)).background_(lightsky);

~w.front;

