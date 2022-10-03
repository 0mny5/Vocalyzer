window.onSongleWidgetReady =
	function()
{
	var songleWidgets = SongleWidgetAPI.findSongleWidgetsByAPI("songle-widget-extra-module-1");
	var volume = SongleWidgetAPI.computeAverageVolume(songleWidgets[0]);
	console.log(volume);
};
