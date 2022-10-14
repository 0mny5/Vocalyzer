window.onSongleWidgetReady =
	function query() {

var currentChord = document.querySelector(".currnet-chord")

		songleWidget.on("chordEnter", function() {

			console.log(currentChord);
		});
	};

setTimeout(query, 1000);


