'use strict';

var dictmap;

fetch('https://nushuscript.org/unicode_nushu/map.json')
.then(function(response) { return response.json(); })
.then(function(res) {
	dictmap = res;
});

function createImg(res) {
	var img = document.createElement('img');
	img.src = 'https://nushuscript.org/unicode_nushu/glyph/' + res + '.jpg';
	return img;
}

function handleConvert() {
	document.getElementById('outputArea').innerHTML = '';

	document.getElementById('inputArea').value.split('').map(function(ch) {
		var ress = dictmap[ch];
		if (!ress) {
			document.getElementById('outputArea').appendChild(document.createTextNode(ch));
		} else {
			document.getElementById('outputArea').appendChild(document.createTextNode(ch));
			ress.map(function(res) {
				document.getElementById('outputArea').appendChild(createImg(res));
			});
		}
	});

	document.getElementById('outputArea').focus();
}
