window.onload =
  function()
  {
    var songleWidgetElement =
      SongleWidgetAPI.createSongleWidgetElement({
        api: "songle-widget-extra-module-2",
        url: "www.youtube.com/watch?v=PqJNc9KVIZE"
      });

    document.body.appendChild(songleWidgetElement);
  }


(function(){if(window.__swExtra__==null){
	window.__swExtra__={}}
__swExtra__.initializeAllModule=function(a){
     if(__swExtra__.modules==null){__swExtra__.modules=[]}
     __swExtra__.modules.push(a);
		var c;c=document.createElement("div");
		c.className="sw-extra-stats-2";
			a.on("chordEnter",function(d){
				var c;c=document.querySelector(".sw-extra-stats-2 .chord");
				return c.textContent=d.chord.name});
};
});
