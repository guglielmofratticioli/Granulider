~w = Window.new("Granullider", Rect(500,500,1000,700));

// final
~start = Button.new(~w, Rect(290,30,80,30)).states_([["Start"],["Stop"]]);

~slid1 = Slider.new(~w,Rect(390,30,120,30))
.background_(Color.black)
.action_({
	arg obj;
	~num1.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid1, Rect(35,0,80,30)).string_("Volume").stringColor_(Color.green);

~slid2 = Slider.new(~w,Rect(560,30,120,30))
.background_(Color.black)
.action_({
	arg obj;
	~num2.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid2, Rect(35,0,80,30)).string_("Pitch").stringColor_(Color.green);

// sound1
~but1 = Button.new(~w, Rect(100,90,80,30)).states_([["Sound 1"]]);

~slid3 = Slider.new(~w, Rect(200,90,100,30))
.background_(Color.black)
.action_({
	arg obj;
	~num3.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid3, Rect(30,0,80,30)).string_("Vol.").stringColor_(Color.green);

~slid4 = Slider.new(~w, Rect(350,90,100,30))
.background_(Color.black)
.action_({
	arg obj;
	~num4.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid4, Rect(25,0,80,30)).string_("Pitch").stringColor_(Color.green);

//sound2
~but2 = Button.new(~w, Rect(520,90,80,30)).states_([["Sound 2"]]);

~slid5 = Slider.new(~w, Rect(620,90,100,30))
.background_(Color.black)
.action_({
	arg obj;
	~num5.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid5, Rect(30,0,80,30)).string_("Vol.").stringColor_(Color.green);

~slid6 = Slider.new(~w, Rect(770,90,100,30))
.background_(Color.black)
.action_({
	arg obj;
	~num6.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid6, Rect(25,0,80,30)).string_("Pitch").stringColor_(Color.green);

//envelope
StaticText.new(~w,Rect(460,150,80,30)).string_("Envelope").stringColor_(Color.black).font_(Font(["Helvetica-bold"].choose,18));

~slid7 = Slider.new(~w, Rect(100,210,130,30))
.background_(Color.black)
.action_({
	arg obj;
	~num7.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid7, Rect(35,0,80,30)).string_("Attack").stringColor_(Color.green);

~slid8 = Slider.new(~w, Rect(320,210,130,30))
.background_(Color.black)
.action_({
	arg obj;
	~num8.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid8, Rect(35,0,80,30)).string_("Decay").stringColor_(Color.green);

~slid9 = Slider.new(~w, Rect(530,210,130,30))
.background_(Color.black)
.action_({
	arg obj;
	~num9.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid9, Rect(35,0,80,30)).string_("Sustain").stringColor_(Color.green);

~slid10 = Slider.new(~w, Rect(740,210,130,30))
.background_(Color.black)
.action_({
	arg obj;
	~num10.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~slid10, Rect(35,0,80,30)).string_("Release").stringColor_(Color.green);

//knobs
~knob1 = Knob.new(~w, Rect(226.5,270,80,80))
.action_({
	arg obj;
	~num11.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~w, Rect(235.5,393,80,20)).string_("Frequency").font_(Font(["Helvetica-bold"].choose, 14));

~knob2 = Knob.new(~w, Rect(459.5,270,80,80))
.action_({
	arg obj;
	~num12.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~w, Rect(470.5,393,80,20)).string_("Duration").font_(Font(["Helvetica-bold"].choose, 14));

~knob3 = Knob.new(~w, Rect(692.5,270,80,80))
.action_({
	arg obj;
	~num13.value_(obj.value.linlin(0,1,0,2000))
});
StaticText.new(~w, Rect(685.5,393,100,20)).string_("Start Behaviour").font_(Font(["Helvetica-bold"].choose, 14));

//numboxes
~num1 = NumberBox.new(~w, Rect(509,31,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num2 = NumberBox.new(~w, Rect(679,31,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num3 = NumberBox.new(~w, Rect(299,91,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num4 = NumberBox.new(~w, Rect(449,91,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num5 = NumberBox.new(~w, Rect(719,91,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num6 = NumberBox.new(~w, Rect(869,91,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num7 = NumberBox.new(~w, Rect(229,211,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num8 = NumberBox.new(~w, Rect(449,211,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num9 = NumberBox.new(~w, Rect(659,211,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num10 = NumberBox.new(~w, Rect(869,211,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num11 = NumberBox.new(~w, Rect(251.5,355,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num12 = NumberBox.new(~w, Rect(485,355,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

~num13 = NumberBox.new(~w, Rect(720,355,34,28))
.decimals_(0)
.background_(Color.black)
.normalColor_(Color.green);

//stethscope
~scope = ScopeView.new(~w, Rect(300, 460, 400, 200));  //non sono sicura su questo, bisogna aggiungere anche ScopeOut2

~w.front;
