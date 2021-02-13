(
~ataques = Array.new;
~folder = PathName.new("/media/atsintli/Archive/SEALI/audio8Clases/Clase_8b");
(
~folder.entries.do({
	arg path;
	~ataques = ~ataques.add(Buffer.read(s, path.fullPath));
});
);

~cress = Array.new;
~folder = PathName.new("/media/atsintli/Archive/SEALI/audio8Clases/Clase_7");
(
~folder.entries.do({
	arg path;
	~cress = ~cress.add(Buffer.read(s, path.fullPath));
});
);

~largos = Array.new;
~folder = PathName.new("/media/atsintli/Archive/SEALI/audio8Clases/Clase_6");
(
~folder.entries.do({
	arg path;
	~largos = ~largos.add(Buffer.read(s, path.fullPath));
});
);

~tremolando = Array.new;
~folder = PathName.new("/media/atsintli/Archive/SEALI/audio8Clases/Clase_5");
(
~folder.entries.do({
	arg path;
	~tremolando = ~tremolando.add(Buffer.read(s, path.fullPath));
});
);

~electronic = Array.new;
~folder = PathName.new("/media/atsintli/Archive/SEALI/audio8Clases/Clase_2");
(
~folder.entries.do({
	arg path;
	~electronic = ~electronic.add(Buffer.read(s, path.fullPath));
});
);

~clase1 = Array.new;
~folder = PathName.new("/media/atsintli/Archive/SEALI/audio8Clases/Clase_1");
(
~folder.entries.do({
	arg path;
	~clase1 = ~clase1.add(Buffer.read(s, path.fullPath));
});
);

);


(
SynthDef(\ataques, {

	arg amp=1, out=0, buf, rate=1, loop = 0, start;
	var sig, env;
	sig = PlayBuf.ar(2, buf, rate, 1, start, loop, doneAction: 2);
	env = EnvGen.kr(Env.new([0, 0.4, 0.4, 0 ], [1, 8, 2]));
	sig = sig * env;
	Out.ar(out, sig);
}).add;

SynthDef(\cress, {

	arg amp=1, out=0, buf, rate=1, loop = 0, start;
	var sig, env;
	sig = PlayBuf.ar(2, buf, rate, 1, start, loop, doneAction: 2);
	env = EnvGen.kr(Env.new([0, 0.3, 0.9, 0 ], [1, 2, 0.3]));
	sig = sig * env;
	Out.ar(out, sig);
}).add;

SynthDef(\largos, {

	arg amp=1, out=0, buf, rate=1, loop = 0, start, pan = 0;
	var sig, env;
	sig = PlayBuf.ar(1, buf, rate, 1, start, loop, doneAction: 2);
	env = EnvGen.kr(Env.new([0, 0.1, 0.15, 0], [0.1, 1, 0.5]));
	sig = sig * env;
	Out.ar(out, Pan2.ar(GVerb.ar(sig, 30, 50), pan));
}).add;

SynthDef(\tremolando, {

	arg amp=1, out=0, buf, rate=1, loop = 0, start;
	var sig, env, rev;
	sig = PlayBuf.ar(1, buf, rate, 1, start, loop, doneAction: 2);
	env = EnvGen.kr(Env.new([0, 0.3, 0.9, 0 ], [2, 2, 0.2]));
	sig = sig * env;
	Out.ar(out, GVerb.ar(sig, 30, 3));
}).add;

SynthDef(\electronic, {

	arg amp=1, out=0, buf, rate=1, loop = 0, start;
	var sig, env, rev;
	sig = PlayBuf.ar(1, buf, rate, 1, start, loop, doneAction: 2);
	env = EnvGen.kr(Env.new([0, 0.3, 0.9, 0 ], [0.5, 3, 0.2]));
	sig = sig * env;
	Out.ar(out, GVerb.ar(sig, 30, 2));
}).add;

SynthDef(\clase4, {
	arg amp=1, out=0, buf, rate=1, loop = 0, start;
	var sig, env;
	sig = PlayBuf.ar(1, buf, rate, 1, start, loop, doneAction: 2);
	env = EnvGen.kr(Env.new([0, 0.2, 0.2, 0 ], [2, 30, 2]));
	sig = sig * env;
	Out.ar(out, sig);
}).add;

SynthDef(\granos, {arg bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04, attack=0.01;
	var grain;
	grain= PlayBuf.ar(1,bufnum,
		BufRateScale.kr(bufnum),
		1,
		BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(attack,dur),doneAction:2)-0.001);
	Out.ar(0,Pan2.ar(grain, pan))}).add;

SynthDef(\sinegrain, {
	arg pan, freq, amp;
	var grain, sig, out, rev;
	sig = SinOsc.ar(freq, 0, amp);
	grain = (EnvGen.kr(Env.sine(0.01, 0.2), doneAction: 2));
	rev = GVerb.ar(grain*sig, 45, 3, 0.8, 0.5, 50, 0.5, 0.8, mul:2);
	out = Out.ar(0, Pan2.ar(rev, pan))}).add;

SynthDef(\sinegrain2, {
	arg pan, freq, amp;
	var grain, sig, out, rev;
	sig = SinOsc.ar(freq, 0, amp);
	grain = (EnvGen.kr(Env.sine(0.01, 0.25), doneAction: 2));
	rev = GVerb.ar(grain*sig, 40, 30, 0.3, 0.5, 60, 0.5, 0.8, mul:1);
	out = Out.ar(0, Pan2.ar(rev, pan))}).add;

SynthDef(\sin_short_env, {
	arg pan, freq, amp, atack = 0.01;
	var env, sig, out, rev;
	sig = SinOsc.ar(freq, 0, amp, SinOsc.ar(freq, 0.5, 0.2));
	env = (EnvGen.kr(Env.new([0, 0.3, 0.3, 0], [0.3, 0.2, 2],[-5, 0, -5]), doneAction: 2));
	rev = GVerb.ar(env*sig, 40, 3, 0.1, 0.5, 15, 0.8, 0.8, mul:0.1);
	out = Out.ar(0, Pan2.ar(rev, pan))}).add;

SynthDef(\sfgrain, {arg bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04;
	var grain, rev;
	grain= PlayBuf.ar(1,bufnum,
		BufRateScale.kr(bufnum),
		1,
		BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(1, dur),doneAction:2)-0.01);
	rev = FreeVerb.ar(grain, 0.33, 0.5, 0.5, 0.2);
	Out.ar(0,Pan2.ar(rev, pan))}).add;

SynthDef(\sfgrain2, {
	|bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04, atack = 0.5|
	var grain, rev;
	grain= PlayBuf.ar(1,bufnum,
		BufRateScale.kr(bufnum),
		1,
		BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(atack, dur),doneAction:2));
	rev = FreeVerb.ar(grain, 0.01, 0.5, 0.5, 0.2);
	Out.ar(0,Pan2.ar(rev, pan)*0.3)}).add;

SynthDef(\sfgrain3, {
	|bufnum=0, pan=0.0, startPos=0.0, amp=0.1, dur=0.04, atack = 0.5|
	var grain, rev;
	grain= PlayBuf.ar(1,bufnum,
		BufRateScale.kr(bufnum),
		1,
		BufFrames.ir(bufnum)*startPos, 0)*(EnvGen.kr(Env.perc(atack, dur),doneAction:2)-0.001);
	rev = FreeVerb.ar(grain, 0.01, 0.5, 0.5, 0.2);
	Out.ar(0,Pan2.ar(rev, pan)*0.3)}).add;

SynthDef(\help_Klank, { arg out=0, i_freq, gate = 1;
	var klank, n, harm, amp, ring, env;
	// harmonics
	harm = \harm.ir(Array.series(8, 1, 1).postln);
	// amplitudes
	amp = \amp.ir(Array.fill(4, 0.1));
	// ring times
	ring = \ring.ir(Array.fill(4, 1));
	klank = Klank.ar(`[harm, amp, ring], {ClipNoise.ar(0.001)}.dup, i_freq);
	env = EnvGen.kr(Env.new([0, 2, 2, 0 ], [5, 13, 2]), gate, doneAction: 2);
	Out.ar(out, env*klank);
}).add;
)
