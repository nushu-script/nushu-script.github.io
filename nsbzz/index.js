'use strict';

var dictmap;

fetch('https://nushuscript.org/nsbzzzd/table.json')
.then(function(response) { return response.json(); })
.then(function(res) {
	dictmap = buildIndex(res);
});

function buildIndex(dictarr) {
	return dictarr.reduce(function(obj, x) {
		var id = x[0], romanization = x[1], chars = x[2];
		for (var i = 0, n = chars.length; i < n; i++) {
			var oldVal = obj[chars[i]];
			if (!oldVal)
				obj[chars[i]] = [[id, romanization]];
			else
				obj[chars[i]].push([id, romanization]);
		}
		return obj;
	}, {});
}

function createImg(input) {
	var id = input[0], romanization = input[1];
	var img = document.createElement('img');
	img.src = 'https://nushuscript.org/nsbzzzd/img/' + id + '.png';
	img.alt = romanization;
	return img;
}

function handleConvert() {
	document.getElementById('outputArea').innerHTML = '';

	document.getElementById('inputArea').value.split('').map(function(ch) {
		document.getElementById('outputArea').appendChild(document.createTextNode(ch));
		var ress = dictmap[ch];
		if (ress) {
			ress.map(function(res) {
				document.getElementById('outputArea').appendChild(createImg(res));
			});
		}
	});

	document.getElementById('outputArea').focus();
}
