
function dominantMotion(){
	var chord = c.innerText;
	var scale = {
		"C" : 0,
		"C#": 1,
		"D♭": 2,
		"D" : 3,
		"D#": 4,
		"E♭": 5,
		"E" : 6,
		"F" : 7,
		"F#": 8,
		"G♭": 9,
		"G" : 10,
		"G#": 11,
		"A♭": 12,
		"A" : 13,
		"A#": 14,
		"B♭": 15,
		"B" : 16
	};
};
	for (let i = 0; i <= 16; i++) {
		for (let j = 0; j <= 16; j++) {
			if (i - j === 5) {
				console.log(i, j).join(" → ");
			}
		}
	}
