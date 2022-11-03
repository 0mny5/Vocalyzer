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
(function(){if(window.__swExtra__==null){
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
		if(c==null){c={}}if(c.force==null){c.force=false}g=__swExtra__.modules;
		d=[];
		for(f=0,a=g.length;f<a;f++){e=g[f];
			if(!e.__wasCreated__||c.force){e.onCreate&&e.onCreate(b)}d.push(e.__wasCreated__=true)}return d};

	__swExtra__.initializeErrorModule=function(b,c){var f,a,e,g,d;
		if(c==null){c={}}if(c.force==null){c.force=false}g=__swExtra__.modules;
		d=[];
		for(f=0,a=g.length;f<a;f++){e=g[f];
			if(!e.__wasErrored__||c.force){e.onError&&e.onError(b)}d.push(e.__wasErrored__=true)}return d};

	__swExtra__.initializeReadyModule=function(b,c){var f,a,e,g,d;
		if(c==null){c={}}if(c.force==null){c.force=false}g=__swExtra__.modules;
		d=[];
		for(f=0,a=g.length;f<a;f++){e=g[f];
			if(!e.__wasReadied__||c.force){e.onReady&&e.onReady(b)}d.push(e.__wasReadied__=true)}return d};

	__swExtra__.random=function(b,a){
		if(b==null){b=0}if(a==null){a=2147483647}return Math.floor(Math.random()*((a-b)+1)+b)}}).call(this);

(function(){__swExtra__.initializeAllModule({onCreate:function(a){
	var b;setTimeout(function(){
		var c;c=document.createElement("div");
		c.className="sw-extra-stats";
		c.style.position="float";
		c.style.color="rgb(64, 64, 64)";
		c.style.fontFamily="'consolas', 'Courier New', 'Courier', 'Monaco', 'monospace'";
		c.style.fontSize=11.5+"px";
		c.style.left=10+"px";
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
		c.appendChild(b("beat","Beat",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("chord","Chord",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("note","Note",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("chorus","Chorus segment",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		c.appendChild(b("repeat","Repeat segment",function(d){
			return d.appendChild(document.createTextNode("-"))
		}));
		return document.body.appendChild(c)},0);
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
				var c;c=document.querySelector(".sw-extra-stats .beat");
				switch(d.beat.position){
					case 1:return c.textContent="x - - - (bpm:"+Math.floor(d.beat.bpm)+")";
					case 2:return c.textContent="- x - - (bpm:"+Math.floor(d.beat.bpm)+")";
					case 3:return c.textContent="- - x - (bpm:"+Math.floor(d.beat.bpm)+")";
					case 4:return c.textContent="- - - x (bpm:"+Math.floor(d.beat.bpm)+")"}});
			a.on("chordEnter",function(d){
				var c;c=document.querySelector(".sw-extra-stats .chord");
				return c.textContent=d.chord.name});
			a.on("noteEnter",function(d){var c;c=document.querySelector(".sw-extra-stats .note");
				return c.textContent=d.note.pitch+" Hz"});
			a.on("chorusSegmentEnter",function(d){
				var c;c=document.querySelector(".sw-extra-stats .chorus");
				return c.textContent="o"});
			a.on("chorusSegmentLeave",function(d){
				var c;c=document.querySelector(".sw-extra-stats .chorus");
				return c.textContent="-"});
			a.on("repeatSegmentEnter",function(d){
				var c;c=document.querySelector(".sw-extra-stats .repeat");
				return c.textContent="o"});
			a.on("repeatSegmentLeave",function(d){
				var c;c=document.querySelector(".sw-extra-stats .repeat");
				return c.textContent="-"});
			a.on("playingProgress",function(d){
				var f,c;c=document.querySelector(".sw-extra-stats .playing-time");
				f=c.querySelector(".duration");
				return f.textContent=b(a.duration)});
			a.on("playingProgress",function(d){
				var f,c;c=document.querySelector(".sw-extra-stats .playing-time");
				f=c.querySelector(".position");
				return f.textContent=b(a.position)});
			return b=function(d){
				var c,e;
				c="00"+Math.floor(d.minutes)%60;
				e="00"+Math.floor(d.seconds)%60;
				return c.substr(c.length-2)+":"+e.substr(e.length-2)
			}}})}).call(this);