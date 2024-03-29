/**
 * @author Takahiro INOUE <takahiro.inoue@aist.go.jp>
 * @license Songle Widget API Examples
 *
 * Visit http://songle.jp/info/Credit.html OR http://widget.songle.jp/docs/v1 for documentation.
 * Copyright (c) 2015 National Institute of Advanced Industrial Science and Technology (AIST)
 *
 * Distributed under the terms of the MIT license only for non-commercial purposes.
 * http://www.opensource.org/licenses/mit-license.html
 *
 * This notice shall be included in all copies or substantial portions of this Songle Widget API Examples.
 * If you are interested in commercial use of Songle Widget API, please contact "songle-ml@aist.go.jp".
 */
(function(){
	if(window.__swExtra__==null){
		window.__swExtra__={}}

	__swExtra__.initializeAllModule=function(a){
		if(__swExtra__.modules==null){__swExtra__.modules=[]}
		__swExtra__.modules.push(a);
		window.onSongleWidgetCreate=function(c,b){
			return __swExtra__.initializeCreateModule(b)};
		window.onSongleWidgetError=function(c,b){
			return __swExtra__.initializeErrorModule(b)};
		return window.onSongleWidgetReady=function(c,b){
			return __swExtra__.initializeReadyModule(b)}};

	__swExtra__.initializeCreateModule=function(b,c){
		var f,a,e,g,d;
		if(c==null){c={}}
		if(c.force==null){c.force=false}
		g=__swExtra__.modules;
		d=[];
		for(f=0,a=g.length;f<a;f++){e=g[f];
			if(!e.__wasCreated__||c.force){e.onCreate&&e.onCreate(b)}
			d.push(e.__wasCreated__=true)
		}return d};

	__swExtra__.initializeErrorModule=function(b,c){var f,a,e,g,d;
		if(c==null){c={}}
		if(c.force==null){c.force=false}
		g=__swExtra__.modules;
		d=[];
		for(f=0,a=g.length;f<a;f++){e=g[f];
			if(!e.__wasErrored__||c.force){e.onError&&e.onError(b)}d.push(e.__wasErrored__=true)}return d};

	__swExtra__.initializeReadyModule=function(b,c){
		var f,a,e,g,d;
		if(c==null){c={}}
		if(c.force==null){c.force=false}g=__swExtra__.modules;
		d=[];
		for(f=0,a=g.length;f<a;f++){e=g[f];
			if(!e.__wasReadied__||c.force){e.onReady&&e.onReady(b)}d.push(e.__wasReadied__=true)}return d};

	__swExtra__.random=function(b,a){
		if(b==null){b=0}
		if(a==null){a=2147483647}
		return Math.floor(Math.random()*((a-b)+1)+b)}
}).call(this);

(function(){
	__swExtra__.initializeAllModule({onCreate:function(a){
		var b;setTimeout(function(){
			a.eventPollingInterval = 0.1;
			/* var c;c=document.createElement("div");
		c.className="sw-extra-stats-1 col-sm-6 col-lg-8";
		c.style.position="relative";
		c.style.display="inline-block";
		c.style.float="left"
		c.style.color="rgb(64, 64, 64)";
		c.style.fontFamily="'klee', 'consolas', 'Courier New', 'Courier', 'Monaco', 'monospace'";
		c.style.fontSize=16.5+"px";
		c.style.top=10+"px";
		c.style.bottom=10+"px";
		c.appendChild(b("playing-time","Playing time",function(d){
			var e;e=document.createElement("span");
			e.className="position";
			e.textContent="00:00";
			d.appendChild(e);
			e=document.createElement("span");
			e.textContent="/";
			d.appendChild(e);
			e=document.createElement("span");
			e.className="duration";
			e.textContent="00:00";
			return d.appendChild(e)}));
		c.appendChild(b("bpm","BPM",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("chord","Chord",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("chord-progression","ChordProgression",function(d){
			var e;e=document.createElement("span");
			e.className="current-chord";
			e.textContent="-";
			d.appendChild(e);
			e=document.createElement("span");
			e.textContent=" → ";
			d.appendChild(e);
			e=document.createElement("span");
			e.className="next-chord";
			e.textContent="-";
			d.appendChild(e);
			e=document.createElement("li");
			e.className="chord-effect";
			e.textContent=" ";
			return d.appendChild(e)}));
		c.appendChild(b("note","Note",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("volume","AvarageVolume",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("chorus","Chorus segment",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("repeat","Repeat segment",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		var statsPosition = document.getElementById("analyzer-1")
		return statsPosition.appendChild(c)*/},0);
		return b=function(e,g,f){
			var d,c;
			c=document.createElement("div");
			d=document.createElement("div");
			d.appendChild(document.createTextNode(g));
			d.style.padding="0px 4px";
			d.style.borderLeft="2px solid #e17";
			c.appendChild(d);d=document.createElement("div");
			d.className=e;
			d.style.padding="0px 4px";
			d.style.borderLeft="0px solid #e17";
			c.appendChild(d);f&&f(d);
			return c}},onReady:function(a){
				var b;a.on("beatPlay",function(d){
					var c;c=document.querySelector(".sw-extra-stats-1 .bpm");
					switch(d.beat.position){
						case 1:return c.textContent=""+Math.floor(d.beat.bpm)+""}});
				a.on("chordEnter",function(d){
					var c;c=document.querySelector(".sw-extra-stats-1 .chord");
					return c.textContent=d.chord.name});
				// aにはsongle apiが入っている。
				a.on("chordEnter",function(d){
					var f,c;c=document.querySelector(".sw-extra-stats-1 .chord-progression");
					f=c.querySelector(".current-chord");
					return f.textContent=d.chord.name});
				a.on("chordEnter",function(d){
					var f,c;c=document.querySelector(".sw-extra-stats-1 .chord-progression");
					f=c.querySelector(".next-chord");
					return f.textContent=d.chord.next.name});

					a.on("chordEnter",function(d){
						var f,c;c=document.querySelector(".sw-extra-stats-1 .chord-progression");
						f=document.querySelector(".chord-effect");
						var onC = new RegExp("^C[^#♭]?7?[^/A-G]*[ →]{3}F[^#♭]?7?[^/A-G]*")
						var onCsharp = new RegExp("^C#[m]?7?[^/A-G]*[ →]{3}F#[m]?7?[^/A-G]*")
						var onDflat = new RegExp("^D♭[m]?7?[^/A-G]*[ →]{3}G♭[m]?7?[^/A-G]*")
						var onD = new RegExp("^D[^#♭]?7?[^/A-G]*[ →]{3}G[^#♭]?7?[^/A-G]*")
						var onDsharp = new RegExp("^D#[m]?7?[^/A-G]*[ →]{3}G#[m]?7?[^/A-G]*")
						var onEflat = new RegExp("^E♭[m]?7?[^/A-G]*[ →]{3}A♭[m]?7?[^/A-G]*")
						var onE = new RegExp("^E[^#♭]?7?[^/A-G]*[ →]{3}A[^#♭]?7?[^/A-G]*")
						var onF = new RegExp("^F[^#♭]?7?[^/A-G]*[ →]{3}B♭[m]?7?[^/A-G]*")
						var onFsharp = new RegExp("^F#[m]?7?[^/A-G]*[ →]{3}B[m]?7?[^/A-G]*")
						var onGflat = new RegExp("^E♭[m]?7?[^/A-G]*[ →]{3}B[m]?7?[^/A-G]*")
						var onG = new RegExp("^G[^#♭]?7?[^/A-G]*[ →]{3}C[^#♭]?7?[^/A-G]*")
						var onGsharp = new RegExp("^G#[m]?7?[^/A-G]*[ →]{3}C♯[m]?7?[^/A-G]*")
						var onAflat = new RegExp("^A♭[m]?7?[^/A-G]*[ →]{3}D♭[m]?7?[^/A-G]*")
						var onA = new RegExp("^A[^#♭]?7?[^/A-G]*[ →]{3}D[^#♭]?7?[^/A-G]*")
						var onAsharp = new RegExp("^A#[m]?7?[^/A-G]*[ →]{3}D♯[m]?7?[^/A-G]*")
						var onBflat = new RegExp("^B♭[m]?7?[^/A-G]*[ →]{3}E♭[m]?7?[^/A-G]*")
						var onB = new RegExp("^B[^#♭]?7?[^/A-G]*[ →]{3}E[^#♭]?7?[^/A-G]*")
						var dim = new RegExp("^[A-G][#♭]?dim7?[ →]{3}[A-G][#♭]?[mM]?7?")
						array = [onC, onCsharp, onDflat, onD, onDsharp, onEflat, onE, onF, onFsharp, onGflat, onG, onGsharp, onAflat, onA, onAsharp, onB]
						array.forEach((strongProgression)=>{
						if(c.innerText.match(strongProgression)){
							f.textContent = "強進行"
						};
						if(c.innerText.match(dim)){
							f.textContent = "増4度解決"
						};
						});
					});
				a.on("chordLeave",function(d){
					var f,c;c=document.querySelector(".sw-extra-stats-1 .chord-progression");
					f=document.querySelector(".chord-effect")
					return f.textContent = "-"});
					
				/* a.on("noteEnter",function(d){var c;c=document.querySelector(".sw-extra-stats-1 .note");
				return c.textContent=d.note.pitch+" Hz"});
			a.on("chorusSegmentEnter",function(d){
				var c;c=document.querySelector(".sw-extra-stats-1 .chorus");
				return c.textContent="o"});
			a.on("chorusSegmentLeave",function(d){
				var c;c=document.querySelector(".sw-extra-stats-1 .chorus");
				return c.textContent="-"});
			a.on("repeatSegmentEnter",function(d){
				var c;c=document.querySelector(".sw-extra-stats-1 .repeat");
				return c.textContent="o"});
			a.on("repeatSegmentLeave",function(d){
				var c;c=document.querySelector(".sw-extra-stats-1 .repeat");
				return c.textContent="-"});
				*/
				a.on("playingProgress",function(d){
					var f,c;c=document.querySelector(".sw-extra-stats-1 .playing-time");
					f=c.querySelector(".duration");
					return f.textContent=b(a.duration)});
				a.on("playingProgress",function(d){
					var f,c;c=document.querySelector(".sw-extra-stats-1 .playing-time");
					f=c.querySelector(".position");
					return f.textContent=b(a.position)});
				return b=function(d){
					var c,e;
					c="00"+Math.floor(d.minutes)%60;
					e="00"+Math.floor(d.seconds)%60;
					return c.substr(c.length-2)+":"+e.substr(e.length-2)
				}}})}).call(this);
